using System;
using Dessert.ViewModels;
using System.Collections.Generic;
using System.Windows.Input;
using Xamarin.Essentials;
using Xamarin.Forms;
using Rg.Plugins.Popup.Extensions;
using Desserts.Views;
using Newtonsoft.Json;
using Desserts.Helpers;
using Desserts.Services.Interface;
using Firebase.Auth;
using Syncfusion.Licensing;

namespace Desserts.ViewModels
{
    public class LoginViewModel : BaseViewModel
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
        private string _Email;
        public string Email
        {
            get { return _Email; }
            set { _Email = value; OnpropertyChanged(); }
        }
        private string _Password;
        public string Password
        {
            get { return _Password; }
            set { _Password = value; OnpropertyChanged(); }
        }
        public FirebaseWebApi webApi;

        private readonly IUser _userService;
        public ICommand loginCmd { get; set; }
        public ICommand SignupCmd { get; set; }
        public ICommand forgotCmd { get; set; }
        public LoginViewModel()
        {
            Email = string.Empty;
            Password = string.Empty;

            webApi = new FirebaseWebApi();
            _userService = DependencyService.Resolve<IUser>();

            loginCmd = new Command(Login);
            SignupCmd = new Command(Signup);
            forgotCmd = new Command(ForgotAsync);
        }
        public async void ForgotAsync()
        {
            //await Application.Current.MainPage.Navigation.PushAsync(new ForgotPasswordPage());
        }
        public async void Login()
        {

            var current = Connectivity.NetworkAccess;
            if (current == NetworkAccess.Internet)
            {
                if (String.IsNullOrEmpty(Email))
                {
                    DependencyService.Get<Toast>().Show("Please enter your email.");
                }
                else if (String.IsNullOrEmpty(Password))
                {
                    DependencyService.Get<Toast>().Show("Please enter your password.");
                }
                else
                {
                    if (Email != string.Empty || Password != string.Empty)
                    {
                        var authProvider = new FirebaseAuthProvider(new FirebaseConfig(webApi.WebAPIKey));
                        try
                        {
                            //var platform = DeviceInfo.Platform;
                            //if (platform != DevicePlatform.UWP)
                            //{
                            //    IsBusy = true;
                            //}
                            IsBusy = true;
                            var response = await _userService.LoginUser(Email.Trim().ToLower(), Password);

                            if (response != null)
                            {
                                try
                                {
                                    var auth = await authProvider.SignInWithEmailAndPasswordAsync(Email.Trim().ToLower(), Password);

                                    var content = await auth.GetFreshAuthAsync();

                                    var serializedcontnet = JsonConvert.SerializeObject(content);

                                    Preferences.Set("Email", Email.Trim().ToLower());
                                    Preferences.Set("Islogined", "true");
                                    Preferences.Set("Name", response.FullName.Trim());
                                    IsBusy = false;
                                    Application.Current.MainPage = new AppShell();
                                    //Application.Current.MainPage = new NavigationPage(new Page2());
                                }
                                catch (Exception ex)
                                {
                                    IsBusy = false;
                                    await Application.Current.MainPage.DisplayAlert("Alert", "Invalid email or password", "OK");

                                    //await Application.Current.MainPage.DisplayAlert("Alert", ex.Message, "OK");
                                }
                            }
                            else
                            {
                                IsBusy = false;
                                await Application.Current.MainPage.DisplayAlert("Alert", "Invalid email or password", "OK");
                            }
                        }
                        catch (Exception ex)
                        {
                            IsBusy = false;
                            await Application.Current.MainPage.DisplayAlert("", "Invalid email or password", "OK");

                            // await Application.Current.MainPage.DisplayAlert("Alert", ex.Message, "OK");
                        }
                    }
                    else
                    {
                        //IsBusy = false;
                        await Application.Current.MainPage.DisplayAlert("", "Email and Password are necessary.", "OK");
                    }
                }

            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
        public async void Signup()
        {
            await Application.Current.MainPage.Navigation.PushAsync(new RegisterPage());
        }
    }
}

