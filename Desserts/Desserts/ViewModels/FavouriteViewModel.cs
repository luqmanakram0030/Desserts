using Dessert.Models;
using Dessert.ViewModels;
using Desserts.Services.Interface;
using Desserts.Views;
using Rg.Plugins.Popup.Extensions;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.CommunityToolkit.UI.Views;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Desserts.ViewModels
{
    public class FavouriteViewModel : BaseViewModel
    {
        private bool _IsBusy = false;
        public bool IsBusy
        {
            get
            {
                return _IsBusy;
            }
            set
            {
                _IsBusy = value;
                //if (_IsBusy)
                //{
                //    Busy = false;
                //}
                //else
                //{
                //    Busy = true;

                //}
                OnpropertyChanged();
            }
        }
        private bool _Busy;
        public bool Busy
        {
            get
            {
                return _Busy;
            }
            set
            {
                _Busy = value;

                OnpropertyChanged();
            }
        }
        private bool _Loading;
        public bool Loading
        {
            get
            {
                return _Loading;
            }
            set
            {
                _Loading = value;
                if (_Loading)
                {
                    Xamarin.Forms.Application.Current.MainPage.Navigation.PushPopupAsync(new IndicatorActity());

                }
                else
                {
                    Xamarin.Forms.Application.Current.MainPage.Navigation.PopPopupAsync();

                }

                OnpropertyChanged();
            }
        }
        private ObservableCollection<DessertModel> _dessertModels;

        public ObservableCollection<DessertModel> dessertModels
        {
            get { return _dessertModels; }
            set
            {
                this._dessertModels = value;
                OnpropertyChanged();
            }
        }
        private string _SearchText;
        public string SearchText
        {
            get { return _SearchText; }
            set { _SearchText = value; OnpropertyChanged(); }
        }
        private readonly IDessert _desertService;
        public ICommand SelectCmd { get; set; }
        public ICommand FavCmd { get; set; }
        public FavouriteViewModel()
        {
            dessertModels = new ObservableCollection<DessertModel>();
            _desertService = DependencyService.Resolve<IDessert>();
            SelectCmd = new Command(SelectedItem);
            FavCmd = new Command(Favourite);
        }
        public async void Favourite(object obj)
        {
            var dessert = obj as DessertModel;
            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                try
                {
                    Loading = true;
                    var result = dessert.BookMarks.Where(i => i.Email == Preferences.Get("Email", "")).FirstOrDefault();
                    dessert.BookMarks.Remove(result);
                    var status = await _desertService.UpdateDessert(dessert);
                    if (status)
                    {
                        dessert.fav_image = "Assets/fav_Icon.png";
                        dessertModels.Remove(dessert);
                        await Application.Current.MainPage.DisplayAlert("", "Removed from Bookmark", "Ok");
                    }
                    Loading = false;
                }
                catch (Exception ex)
                {
                    Loading = false;
                    await Application.Current.MainPage.DisplayAlert("", ex.Message, "Ok");
                }
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
        public async void SelectedItem(object obj)
        {
            try
            {
                var item = obj as DessertModel;
                if (item.BookMarks == null || item.BookMarks.Count() == 0)
                {
                    item.BookMarks = new List<BokkMarkModel>();
                }
                if (item.Comments == null || item.Comments.Count() == 0)
                {
                    item.Comments = new List<CommentsModel>();
                }
                //if you want to use show detail an other page .Comment above two line and uncomment below line 
                await Application.Current.MainPage.Navigation.PushAsync(new DessertDetailPage(item));
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("", ex.Message, "Ok");
            }
        }
        public async void GetItems()
        {
            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                try
                {
                    IsBusy = true;
                    Busy = false;
                    await Task.Run(async () =>
                    {
                        var list = await _desertService.GetAllDessertAsync();
                        if (list == null || list.Count == 0)
                        {
                            IsBusy = false;
                            Busy = true;
                        }
                        else
                        {
                            foreach (var item in list)
                            {
                                if (item.Comments == null || item.Comments.Count() == 0)
                                {
                                    item.Comments = new List<CommentsModel>();
                                }
                                if (item.BookMarks == null || item.BookMarks.Count() == 0)
                                {
                                    item.BookMarks = new List<BokkMarkModel>();
                                    item.fav_image = "Assets/fav_Icon.png";
                                }
                                else
                                {
                                    var bookmark = item.BookMarks.Where(a => a.Email == Preferences.Get("Email", "")).FirstOrDefault();
                                    if (bookmark == null)
                                    {
                                        item.fav_image = "Assets/fav_Icon.png";
                                    }
                                    else
                                    {
                                        item.fav_image = "Assets/heart.png"; 
                                        if (!String.IsNullOrEmpty(item.imagesrc))
                                        {
                                            Device.BeginInvokeOnMainThread(() =>
                                            {
                                                byte[] Base64Stream = Convert.FromBase64String(item.imagesrc);
                                                item.image = ImageSource.FromStream(() => new MemoryStream(Base64Stream));
                                            });
                                        }
                                        Device.BeginInvokeOnMainThread(() =>
                                        {
                                            dessertModels.Add(item);
                                        });
                                    }
                                }
                            }
                            IsBusy = false;
                            Busy = true;
                            //Device.BeginInvokeOnMainThread(() =>
                            //{
                            //    CurrentState = LayoutState.None;
                            //});
                        }
                        //Refreshing();
                    });
                }
                catch (Exception ex)
                {
                    IsBusy = false;
                    Busy = true;
                    //Device.BeginInvokeOnMainThread(() =>
                    //{
                    //    CurrentState = LayoutState.Empty;
                    //});
                    await Application.Current.MainPage.DisplayAlert("", ex.Message, "OK");
                }
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
    }
}
