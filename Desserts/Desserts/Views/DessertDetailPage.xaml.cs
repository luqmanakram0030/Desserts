using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using Dessert.Models;
using Desserts.Models;
using Desserts.Services.Implementation;
using Desserts.Services.Interface;
using Rg.Plugins.Popup.Extensions;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Desserts.Views
{	
	public partial class DessertDetailPage : ContentPage
    {
        private bool _IsBusy;
        public bool IsBusy
        {
            get
            {
                return _IsBusy;
            }
            set
            {
                _IsBusy = value;
                if (_IsBusy)
                {
                    Xamarin.Forms.Application.Current.MainPage.Navigation.PushPopupAsync(new IndicatorActity());

                }
                else
                {
                    Xamarin.Forms.Application.Current.MainPage.Navigation.PopPopupAsync();

                }

                OnPropertyChanged();
            }
        }
        private int _count;

        public int count
        {
            get { return _count; }
            set { _count = value;OnPropertyChanged(); }
        }

        private readonly IDessert _dessertService;
        private DessertModel dessert;
        public DessertDetailPage (DessertModel dessert)
        {
			InitializeComponent ();
            _dessertService = DependencyService.Resolve<IDessert>();
            count = 0;
            this.dessert = dessert;
            if (this.dessert.BookMarks != null|| this.dessert.BookMarks.Count() != 0)
            {
                var result = this.dessert.BookMarks.Where(i => i.Email == Preferences.Get("Email", "")).FirstOrDefault();
                if (result == null)
                {
                    fav.Source = "Assets/fav_Icon.png";
                }
                else
                {
                    fav.Source = "Assets/heart.png";
                }
            }
            else
            {
                this.dessert.BookMarks = new List<BokkMarkModel>();
            }
            if (this.dessert.Comments == null || this.dessert.Comments.Count() == 0)
            {
                this.dessert.Comments = new List<CommentsModel>();
            }
            if (!String.IsNullOrEmpty(dessert.imagesrc))
            {
                img.IsVisible = true;
                byte[] Base64Stream = Convert.FromBase64String(dessert.imagesrc);
                img.Source = ImageSource.FromStream(() => new MemoryStream(Base64Stream));
            }
            else 
            {
                img.IsVisible = false;
            }
            name.Text = dessert.name;
            des.Text = dessert.description;
            time.Text = dessert.time;
            Def.Text = dessert.difficulty;
            foreach (var item in dessert.ingredientModels)
            {
                count = count + 1;
                item.id = count;
            }

            ingredientListView.ItemsSource = dessert.ingredientModels;
        }

        async void Button_Clicked(System.Object sender, System.EventArgs e)
        {
           await Navigation.PushModalAsync(new CommentPage());
        }

        private async void back_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }

        private async void fav_Clicked(object sender, EventArgs e)
        {
            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                try
                {
                    IsBusy = true;
                    var result = dessert.BookMarks.Where(i => i.Email == Preferences.Get("Email", "")).FirstOrDefault();
                    if (result == null)
                    {
                        dessert.BookMarks.Add(new BokkMarkModel() { Email = Preferences.Get("Email", "") });
                        var status = await _dessertService.UpdateDessert(dessert);
                        if (status)
                        {
                            fav.Source = "Assets/heart.png";
                            await DisplayAlert("", "Dessert Bookmarked", "Ok");
                        }
                    }
                    else
                    {
                        dessert.BookMarks.Remove(result);
                        var status = await _dessertService.UpdateDessert(dessert);
                        if (status)
                        {
                            fav.Source = "Assets/fav_Icon.png";
                            await DisplayAlert("", "Removed from Bookmark", "Ok");
                        }
                    }
                    IsBusy = false;
                }
                catch (Exception ex)
                {
                    IsBusy = false;
                    await DisplayAlert("", ex.Message, "Ok");
                }
            }
            else
            {
                await DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
    }
}

