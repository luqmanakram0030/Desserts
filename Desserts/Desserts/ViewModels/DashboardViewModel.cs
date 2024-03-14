using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices.ComTypes;
using System.Threading.Tasks;
using System.Windows.Input;
using Dessert.Models;
using Desserts;
using Desserts.Models;
using Desserts.Services.Implementation;
using Desserts.Services.Interface;
using Desserts.Views;
using Rg.Plugins.Popup.Extensions;
using Xamarin.CommunityToolkit.Extensions;
using Xamarin.CommunityToolkit.UI.Views;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.PlatformConfiguration;
using System.Threading;
using System.Linq;
using System.Drawing;
using System.Timers;
using System.Xml.Linq;

namespace Dessert.ViewModels
{
	public class DashboardViewModel:BaseViewModel
    {
        
        private bool _IsBusy =false;
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
        private DashboardPage dashboardPage;
        private MyDessertsPage dMyPage;

        public ObservableCollection<DessertModel> dessertModels
        {
            get { return _dessertModels; }
            set { this._dessertModels = value;
                OnpropertyChanged();
            }
        }
        private LayoutState _CurrentState;
        public LayoutState CurrentState
        {
            get { return _CurrentState; }
            set { _CurrentState = value; OnpropertyChanged(); }
        }
          private string _SearchText;
        public string SearchText
        {
            get { return _SearchText; }
            set { _SearchText = value; OnpropertyChanged(); }
        }
        private readonly IDessert _desertService;
        public ICommand DeleteCmd { get; set; }
        public ICommand SaveCmd { get; set; }
        public ICommand SelectCmd { get; set; }
        public ICommand AddCmd { get; set; }
        public ICommand EditCmd { get; set; }
        public ICommand CommentCmd { get; set; }
        public ICommand FavCmd { get; set; }

        public DashboardViewModel(DashboardPage dashboardPage)
        {
            dessertModels = new ObservableCollection<DessertModel>();
            _desertService = DependencyService.Resolve<IDessert>();
            this.dashboardPage = dashboardPage;
            //GetItems();
            //Refreshing();
            SelectCmd = new Command(SelectedItem);
            SaveCmd = new Command(Save); 
            CommentCmd = new Command(Comment);
            FavCmd = new Command(Favourite);
        }
        public DashboardViewModel(MyDessertsPage dMyPage)
        {
            dessertModels = new ObservableCollection<DessertModel>();
            _desertService = DependencyService.Resolve<IDessert>();
            this.dMyPage = dMyPage;
            //GetMyItems();
            DeleteCmd = new Command(DeleteDessert);
            AddCmd = new Command(AddDessert);
            EditCmd = new Command(EditDessert);
            SelectCmd = new Command(SelectedItem);
            FavCmd = new Command(Favourite);
        }
        private bool _retur_status;

        public bool return_status
        {
            get { return _retur_status; }
            set { _retur_status = value; OnpropertyChanged(); }
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
                    if (result == null)
                    {
                        dessert.BookMarks.Add(new BokkMarkModel() { Email = Preferences.Get("Email", "") });
                        var status = await _desertService.UpdateDessert(dessert);
                        if (status)
                        {
                            dessert.fav_image = "Assets/heart.png";
                            await Application.Current.MainPage.DisplayAlert("", "Dessert Bookmarked", "Ok");
                        }
                    }
                    else
                    {
                        dessert.BookMarks.Remove(result);
                        var status = await _desertService.UpdateDessert(dessert);
                        if (status)
                        {
                            dessert.fav_image = "Assets/fav_Icon.png";
                            await Application.Current.MainPage.DisplayAlert("", "Removed from Bookmark", "Ok");
                        }
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
        public async void Comment(object obj)
        {
            var item = obj as DessertModel;
            item.isExpanded = !item.isExpanded;
        }
        public async void Refreshing()
        {
            try
            {
                //Device.BeginInvokeOnMainThread(() => {
                    Device.StartTimer(TimeSpan.FromSeconds(1), () =>
                    {
                        Refreshed();
                        if (_retur_status == false)
                        {
                            dessertModels = new ObservableCollection<DessertModel>();
                            GetItems();
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    });
                //});
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("", ex.Message, "Ok");
            }
        }
        public async void Refreshed()
        {
            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                try
                {
                    var d_list = await _desertService.GetAllDessertAsync();
                    var count = d_list.Count();
                    if (dessertModels.Count() < count)
                    {
                        return_status= false;
                    }
                    else
                    {
                        return_status= true;
                    }
                }
                catch (Exception ex)
                {
                    await Application.Current.MainPage.DisplayAlert("", ex.Message, "OK");
                }
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
        public async void DeleteDessert(object obj)
        {
            var item = obj as DessertModel;
            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                try
                {

                    Loading = true;
                    var Status = await _desertService.DeleteDessert(item.Key);
                    if (Status == true)
                    {
                        dessertModels.Remove(item);
                        await Application.Current.MainPage.DisplayAlert("", "Item successfully deleted.", "OK");
                        SearchText = "";
                    }
                    else
                    {
                        await Application.Current.MainPage.DisplayAlert("", "Something went wrong. Try again.", "OK");
                    }
                    Loading = false;
                }
                catch (Exception ex)
                {
                    Loading = false; 
                    await Application.Current.MainPage.DisplayAlert("", ex.Message, "OK");
                }
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
        public async void Save()
        {

            try
            {
                Loading = true;
                foreach (var item in dessertModels)
                {
                    
                    var Status = await _desertService.RegisterDessert(item);
                }
                Loading = false;
            }
            catch (Exception ex)
            { 
            
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
                    //Device.BeginInvokeOnMainThread(() =>
                    //{
                    //    CurrentState = LayoutState.Loading;
                    //});
                    await Task.Run(async () =>
                    {
						var list = await _desertService.GetAllDessertAsync();
						if (list == null || list.Count == 0)
						{
                            IsBusy = false;
                            Busy = true;
                            //Device.BeginInvokeOnMainThread(() =>
                            //{
                            //    CurrentState = LayoutState.Empty;
                            //});
                        }
						else
						{
							foreach (var item in list)
                            {
                                if (!String.IsNullOrEmpty(item.imagesrc))
                                {
                                    Device.BeginInvokeOnMainThread(() =>
                                    {
                                        byte[] Base64Stream = Convert.FromBase64String(item.imagesrc);
                                        item.image = ImageSource.FromStream(() => new MemoryStream(Base64Stream));
                                    });
                                }
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
                                    }
                                }
                                Device.BeginInvokeOnMainThread(() =>
                                {
                                    dessertModels.Add(item);
                                });
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
		public async void GetMyItems()
		{
            var current = Connectivity.NetworkAccess;
			if (current == NetworkAccess.Internet)
			{
				try
                {
                    IsBusy = true;
                    Busy = false;
                    var email = Preferences.Get("Email", "");
                    //Device.BeginInvokeOnMainThread(() =>
                    //{
                    //    CurrentState = LayoutState.Loading;
                    //});
                    await Task.Run(async () =>
                    {
						var list = await _desertService.GetAllDessertAsync();
						if (list == null || list.Count == 0)
						{
                            IsBusy = false;
                            Busy = true;
                            //Device.BeginInvokeOnMainThread(() =>
                            //{
                            //    CurrentState = LayoutState.Empty;
                            //});
                        }
						else
						{
							foreach (var item in list)
							{
                                if("thibaultcoussement2002@gmail.com"== Preferences.Get("Email", ""))
                                {
                                    if (!String.IsNullOrEmpty(item.imagesrc))
                                    {
                                        //Device.BeginInvokeOnMainThread(() =>
                                        //{
                                            byte[] Base64Stream = Convert.FromBase64String(item.imagesrc);
                                            item.image = ImageSource.FromStream(() => new MemoryStream(Base64Stream));
                                        //});
                                    }
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
                                        }
                                    }
                                    //Device.BeginInvokeOnMainThread(() =>
                                    //{
                                    dessertModels.Add(item);
                                    //});
                                }
								else if (item.email == Preferences.Get("Email", ""))
								{
                                    if (!String.IsNullOrEmpty(item.imagesrc))
                                    {
                                        //Device.BeginInvokeOnMainThread(() =>
                                        //{
                                            byte[] Base64Stream = Convert.FromBase64String(item.imagesrc);
                                            item.image = ImageSource.FromStream(() => new MemoryStream(Base64Stream));
                                        //});
                                    }
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
                                        }
                                    }
                                    //Device.BeginInvokeOnMainThread(() =>
                                    //{
                                    dessertModels.Add(item);
                                    //});
                                }
                            }
                            IsBusy = false;
                            Busy = true;
                            //Device.BeginInvokeOnMainThread(() =>
                            //{
                            //    CurrentState = LayoutState.None;
                            //});
                        }
                    });
                }
                catch (Exception ex)
                {
                    IsBusy = false; Busy = true;
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
		public async void EditDessert(object obj)
		{
            var item = obj as DessertModel;
			RequestForPermission(item);
            SearchText = "";
        }
		public async void AddDessert()
		{
            
            var item = new DessertModel();
            RequestForPermission(item);
            SearchText = "";
        }
        public async void RequestForPermission(DessertModel model)
        {
            var item = model;
            var platform = DeviceInfo.Platform;
            if (platform != DevicePlatform.UWP)
            {

                var android_api = DependencyService.Get<IAndroidVersion>().Version();
                if (android_api == 33 || android_api == 34)
                {
                    var Status = PermissionStatus.Unknown;
                    Status = await Permissions.CheckStatusAsync<Permissions.Media>();
                    if (Status == PermissionStatus.Granted)
                    {
                        RequestCameraPermission(item);
                    }
                    else
                        Status = await Permissions.RequestAsync<Permissions.Media>();

                    if (Permissions.ShouldShowRationale<Permissions.Media>())
                    {
                        await Application.Current.MainPage.DisplayAlert("", "App needs media permission", "OK");
                    }

                    if (Status != PermissionStatus.Granted)
                    {
                        Status = await Permissions.RequestAsync<Permissions.StorageRead>();
                    }
                    //else if (Status == PermissionStatus.Granted)
                    //{
                    //    RequestCameraPermission();
                    //}
                }
                else
                {
                    var Status = PermissionStatus.Unknown;
                    Status = await Permissions.CheckStatusAsync<Permissions.StorageRead>();
                    if (Status == PermissionStatus.Granted)
                    {
                        RequestCameraPermission(item);
                    }
                    else
                        Status = await Permissions.RequestAsync<Permissions.StorageRead>();

                    if (Permissions.ShouldShowRationale<Permissions.StorageRead>())
                    {
                        await Application.Current.MainPage.DisplayAlert("", "App needs storage permission", "OK");
                    }

                    if (Status != PermissionStatus.Granted)
                    {
                        Status = await Permissions.RequestAsync<Permissions.StorageRead>();
                    }
                    //else if (Status == PermissionStatus.Granted)
                    //{
                    //    RequestCameraPermission();
                    //}
                }
            }
            else
            {
                var Status = PermissionStatus.Unknown;
                Status = await Permissions.CheckStatusAsync<Permissions.StorageRead>();
                if (Status == PermissionStatus.Granted)
                {
                    RequestCameraPermission(item);
                }
                else
                    Status = await Permissions.RequestAsync<Permissions.StorageRead>();

                if (Permissions.ShouldShowRationale<Permissions.StorageRead>())
                {
                    await Application.Current.MainPage.DisplayAlert("", "App needs storage permission", "OK");
                }

                if (Status != PermissionStatus.Granted)
                {
                    Status = await Permissions.RequestAsync<Permissions.StorageRead>();
                }
                //else if (Status == PermissionStatus.Granted)
                //{
                //    RequestCameraPermission();
                //}
            }
        }
        public async void RequestCameraPermission(DessertModel model)
        {
            var item = model;
            var Status = PermissionStatus.Unknown;
            Status = await Permissions.CheckStatusAsync<Permissions.Camera>();
            if (Status == PermissionStatus.Granted)
            {
                await Application.Current.MainPage.Navigation.PushAsync(new AddDessertPage(item));
            }
            else
                Status = await Permissions.RequestAsync<Permissions.Camera>();

            if (Permissions.ShouldShowRationale<Permissions.Camera>())
            {
                await Application.Current.MainPage.DisplayAlert("", "App needs camera permission", "OK");
            }

            if (Status != PermissionStatus.Granted)
            {
                Status = await Permissions.RequestAsync<Permissions.Camera>();
            }
            //else if (Status == PermissionStatus.Granted)
            //{
            //    await Application.Current.MainPage.Navigation.PushAsync(new AddDessertPage());
            //}
        }

        public async void SelectedItem(object obj)
        {
            try
			{
                var item = obj as DessertModel;
                if (item.BookMarks == null|| item.BookMarks.Count() == 0 )
                {
                    item.BookMarks = new List<BokkMarkModel>();
                }
                if (item.Comments == null ||item.Comments.Count() == 0)
                {
                    item.Comments = new List<CommentsModel>();
                }
                    //if you want to use show detail an other page .Comment above two line and uncomment below line 
                await Application.Current.MainPage.Navigation.PushAsync(new DessertDetailPage(item));
			}
			catch (Exception ex)
			{
				await Application.Current.MainPage.DisplayAlert("",ex.Message,"Ok");
			}
        }
        
    }
}

