using System;
using Desserts.Services.Implementation;
using Desserts.Services.Interface;
using Desserts.Views;
using Plugin.FirebasePushNotification;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Desserts
{
    public partial class App : Application
    {
        public App()
        {
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("NDIyNDM0QDMxMzkyZTMxMmUzMEtUU3Y3TGRlUU52T0xNL2hwbjdVTWVrREZSTldaNzR1cktoU0dLSk1lWE09");

            InitializeComponent();
            DependencyService.Register<IUser, UserService>();
            DependencyService.Register<IDessert, DessertService>();
            //Preferences.Remove("Islogined", "");
            var isLogin = Preferences.Get("Islogined", "default");
            if (isLogin == "default")
            {
                MainPage = new NavigationPage(new MainPage());
            }
            else
            {
                if (Device.RuntimePlatform == Device.UWP)
                {
                    MainPage = new NavigationPage(new TabbedPage1());
                }
                else 
                {
                    MainPage = new AppShell();
                    CrossFirebasePushNotification.Current.Subscribe("all");
                    CrossFirebasePushNotification.Current.OnTokenRefresh += Current_TokenRefresh;
                    // Push message received event
                    CrossFirebasePushNotification.Current.OnNotificationReceived += OnNotificationReceived;
                    //Push message received event
                    CrossFirebasePushNotification.Current.OnNotificationOpened += (s, p) =>
                    {
                        System.Diagnostics.Debug.WriteLine("Opened");
                        foreach (var data in p.Data)
                        {
                            System.Diagnostics.Debug.WriteLine($"{data.Key} : {data.Value}");
                        }
                    };
                }
            }
        }
        private void Current_TokenRefresh(object source, FirebasePushNotificationTokenEventArgs e)
        {
            Preferences.Set("fcmToken", e.Token);
            System.Diagnostics.Debug.WriteLine($"TOKEN : {e.Token}");
        }
        private void OnNotificationReceived(object source, FirebasePushNotificationDataEventArgs e)
        {
            //Application.Current.MainPage = new AppShellPage();
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
