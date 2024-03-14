using System;
using Dessert.ViewModels;
using Desserts.Helpers;
using Desserts.Models;
using Desserts.Services.Interface;
using Desserts.Views;
using Firebase.Auth;
using Newtonsoft.Json;
using Rg.Plugins.Popup.Extensions;
using System.Windows.Input;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Desserts.ViewModels
{
    public class UserSignupViewModel : BaseViewModel
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
        private string _ConfirmPassword;

        public string ConfirmPassword
        {
            get { return _ConfirmPassword; }
            set { _ConfirmPassword = value; OnpropertyChanged(); }
        }

        public FirebaseWebApi webApi;

        private readonly IUser _userService;
        private ApplicationUser _User;
        public ApplicationUser User
        {
            get { return _User; }
            set { _User = value; OnpropertyChanged(); }
        }
        public ICommand loginCmd { get; set; }
        public ICommand SignupCmd { get; set; }
        public UserSignupViewModel()
        {
            User = new ApplicationUser();
            webApi = new FirebaseWebApi();
            _userService = DependencyService.Resolve<IUser>();

            loginCmd = new Command(GotoLogin);
            SignupCmd = new Command(SignupAsync);
        }
        public async void SignupAsync()
        {
            var current = Connectivity.NetworkAccess;

            if (current == NetworkAccess.Internet)
            {
                try
                {
                    if (String.IsNullOrEmpty(User.Email))
                    {
                        DependencyService.Get<Toast>().Show("Please enter your email.");
                    }
                    else if (String.IsNullOrEmpty(User.FullName))
                    {
                        DependencyService.Get<Toast>().Show("Please enter your name.");
                    }
                    else
                    {
                        if (User.Password == ConfirmPassword)
                        {
                            User.Email = User.Email.ToLower().Trim();
                            var authProvider = new FirebaseAuthProvider(new FirebaseConfig(webApi.WebAPIKey));

                            IsBusy = true;

                            var auth = await authProvider.CreateUserWithEmailAndPasswordAsync(User.Email.Trim().ToLower(), User.Password);

                            await _userService.RegisterUser(User);

                            var content = await auth.GetFreshAuthAsync();

                            var serializedcontnet = JsonConvert.SerializeObject(content);

                            Preferences.Set("Email", User.Email.Trim().ToLower());

                            Preferences.Set("Name", User.FullName.Trim());

                            IsBusy = false;

                            await Application.Current.MainPage.DisplayAlert("Success!", "Registered.", "Ok");

                            await Application.Current.MainPage.Navigation.PopAsync();
                        }
                        else
                        {
                            //await Application.Current.MainPage.DisplayAlert("", "Please Check and Fill all the Entries", "Ok");
                            await Application.Current.MainPage.DisplayAlert("", "Please enter the same password!", "Ok");
                        }
                    }

                }
                catch (FirebaseAuthException ex)
                {
                    IsBusy = false;
                    var responseJson = ex.ResponseData;
                    var message = $"Firebase authentication error: {ex.InnerException?.Message ?? ex.Message}";
                    var test = new FirebaseAuthenticationException(message, responseJson);
                    await App.Current.MainPage.DisplayAlert("Alert", test.Message, "OK");
                }
                catch (Exception ex)
                {
                    IsBusy = false;

                    //await Application.Current.MainPage.DisplayAlert("", "Try again.", "Ok");
                    await Application.Current.MainPage.DisplayAlert("", "Account already exist", "Ok");
                    //await Application.Current.MainPage.DisplayAlert("Alert", ex.Message, "OK");
                }
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("", "Connect your device to internet.", "OK");
            }
        }
        public async void GotoLogin()
        {
            await Application.Current.MainPage.Navigation.PopAsync();
        }
    }
}


