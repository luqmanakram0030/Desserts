using Dessert.Models;
using Dessert.ViewModels;
using Desserts.Models;
using Desserts.Services.Implementation;
using Desserts.Services.Interface;
using Desserts.Views;
using Rg.Plugins.Popup.Extensions;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.CommunityToolkit.UI.Views;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Desserts.ViewModels
{
    public class AddDessertViewModel : BaseViewModel
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

                OnpropertyChanged();
            }
        }
        private DessertModel _dessertModel;

        public DessertModel dessert
        {
            get { return _dessertModel; }
            set { _dessertModel = value; OnpropertyChanged(); }
        }
        public int count { get; set; }
        private Ingredient _ing;

        public Ingredient ing
        {
            get { return _ing; }
            set { _ing = value; OnpropertyChanged(); }
        }

        private ObservableCollection<Ingredient> _ingList;

        public ObservableCollection<Ingredient> ingList
        {
            get { return _ingList; }
            set { _ingList = value; OnpropertyChanged(); }
        }
        private ImageSource _profilePic;

        public ImageSource profilePic
        {
            get { return _profilePic; }
            set { _profilePic = value; OnpropertyChanged(); }
        }
        private int _id;

        public int id
        {
            get { return _id; }
            set { _id = value; OnpropertyChanged(); }
        }

        private readonly IDessert _desertService;
        public ICommand deleteingCmd { get; set; }
        public ICommand AddCmd { get; set; }
        public ICommand SaveCmd { get; set; }
        public ICommand ImageCmd { get; set; }
        public AddDessertViewModel(DessertModel model)
        {
            count = 1;
            if (!String.IsNullOrEmpty(model.Key))
            {
                id = 1;
                dessert = model;
                ingList = model.ingredientModels;
                byte[] Base64Stream = Convert.FromBase64String(dessert.imagesrc);
                profilePic = ImageSource.FromStream(() => new MemoryStream(Base64Stream));
            }
            else
            {
                id = 0;
                ingList = new ObservableCollection<Ingredient>();
                dessert = new DessertModel();
                dessert.DessertImages = new List<string>();
                dessert.Comments = new List<CommentsModel>();
                dessert.BookMarks = new List<BokkMarkModel>();
                dessert.ingredientModels = new ObservableCollection<Ingredient>();
            }
            ing = new Ingredient();
            _desertService = DependencyService.Resolve<IDessert>();
            AddCmd = new Command(AddIngredient);
            deleteingCmd = new Command(DeleteIngredient);
            SaveCmd = new Command(SaveDessert);
            ImageCmd = new Command(AddRecipeImage);
        }
        public async void AddRecipeImage()
        {
            var result = await Application.Current.MainPage.DisplayActionSheet("Change Picture", "Cancel", null, "Take Photo", "Select Photo");
            if (result == "Take Photo")
            {
                if (!MediaPicker.IsCaptureSupported)
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Camera is not available", "OK");
                    return;
                }
                var photo = await MediaPicker.CapturePhotoAsync(new MediaPickerOptions
                {
                    Title = "Take a photo"
                });
                if (photo != null)
                {
                    var stream = await photo.OpenReadAsync();
                    var bytes = await ProcessPhoto(stream);
                    //dessert.DessertImages= new List<string>();
                    //dessert.DessertImages.Add(Convert.ToBase64String(bytes));

                    string base64 = System.Convert.ToBase64String(bytes);
                    dessert.imagesrc = base64;
                }
            }
            else if (result == "Select Photo")
            {
                var photo = await MediaPicker.PickPhotoAsync(new MediaPickerOptions
                {
                    Title = "Select a photo"
                });
                if (photo != null)
                {
                    var stream = await photo.OpenReadAsync();
                    var bytes = await ProcessPhoto(stream);
                    //dessert.DessertImages= new List<string>();
                    //dessert.DessertImages.Add(Convert.ToBase64String(bytes));

                    string base64 = System.Convert.ToBase64String(bytes);
                    dessert.imagesrc = base64;
                }
            }
        }
        private async Task<byte[]> ProcessPhoto(Stream stream)
        {
            var memoryStream = new MemoryStream();
            await stream.CopyToAsync(memoryStream);
            var bytes = memoryStream.ToArray();

            if (stream != null)
            {
                profilePic = ImageSource.FromStream(() => new MemoryStream(bytes));
                //this.stream = stream;
            }
            return bytes;
        }
        public async void AddIngredient()
        {
            if (!String.IsNullOrEmpty(ing.description))
            {
                ing.HeadingVisible = true;
                ing.id = count;
                count++;
                ing.HeadingDescVisible = true;
                if (String.IsNullOrEmpty(ing.Heading))
                {
                    ing.HeadingVisible = false;
                }
                if (String.IsNullOrEmpty(ing.HeadingDescription))
                {
                    ing.HeadingDescVisible = false;
                }
                ingList.Add(ing);
                ing = new Ingredient();
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Write something in description.", "OK");
            }
        }
        public async void DeleteIngredient(object obj)
        {
            var item = obj as Ingredient;
            if (item != null) 
            {
                ingList.Remove(item);
            }
        }
        public async void SaveDessert()
        {
            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                var platform = DeviceInfo.Platform;
                try
                {
                    if (!String.IsNullOrEmpty(dessert.name) && !String.IsNullOrEmpty(dessert.difficulty)&& !String.IsNullOrEmpty(dessert.description) && !String.IsNullOrEmpty(dessert.time) && !String.IsNullOrEmpty(dessert.imagesrc) && ingList.Count() != 0&&ingList != null)
                    {
                        //if (platform != DevicePlatform.UWP)
                        //{
                        //    IsBusy = true;
                        //}

                        IsBusy = true;
                        dessert.email = Preferences.Get("Email", "");
                        dessert.ingredientModels = ingList;
                        if (id == 0)
                        {
                            var Status = await _desertService.RegisterDessert(dessert);
                            if (Status == true)
                            {
                                await Application.Current.MainPage.DisplayAlert("", "Your Dessert is saved.", "OK");
                            }
                            else
                            {
                                await Application.Current.MainPage.DisplayAlert("", "Something went wrong.", "OK");
                            }
                        }
                        else
                        {
                            var Status = await _desertService.UpdateDessert(dessert);
                            if (Status == true)
                            {
                                await Application.Current.MainPage.DisplayAlert("", "Your Dessert is updated.", "OK");
                            }
                            else
                            {
                                await Application.Current.MainPage.DisplayAlert("", "Something went wrong.", "OK");
                            }
                        }
                        //if (platform != DevicePlatform.UWP)
                        //{
                        //    IsBusy = false;
                        //}
                        IsBusy = false;
                        await Application.Current.MainPage.Navigation.PopAsync();
                    }
                    else
                    {
                        await Application.Current.MainPage.DisplayAlert("", "Add Full Detail.", "OK");
                    }
                }
                catch (Exception ex)
                {
                    IsBusy = false;
                    //if (platform != DevicePlatform.UWP)
                    //{
                    //    IsBusy = true;
                    //}
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
