using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using Dessert.Models;
using Dessert.ViewModels;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Desserts.Views
{	
	public partial class DashboardPage : ContentPage
	{
        public DashboardViewModel vm;
        public DashboardPage ()
		{
            try
            {
                InitializeComponent();
                BindingContext = vm = new DashboardViewModel(this);
            }
            catch (Exception e)
            { 
            
            }
		}
        protected override void OnAppearing()
        {
            base.OnAppearing();
            Device.BeginInvokeOnMainThread(() =>
            {
                //dessertlist.ItemsSource = vm.dessertModels;
            });
            vm.IsBusy = false;
            vm.Busy = false;
            vm.dessertModels = new ObservableCollection<DessertModel>();
            vm.Refreshing();
        }
        private void Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            Device.BeginInvokeOnMainThread(() =>
            {
                
            }); if (string.IsNullOrEmpty(e.NewTextValue))
            {
                dessertlist.ItemsSource = vm.dessertModels;
            }
            else
            {

                dessertlist.ItemsSource = vm.dessertModels.Where(i => i.name.ToLower().Contains(e.NewTextValue.ToLower()));
            }
        }

        private void logout_Clicked(object sender, EventArgs e)
        {
            Preferences.Remove("Email", "");
            Preferences.Remove("Islogined", "");
            Preferences.Remove("Name", "");
            Application.Current.MainPage = new NavigationPage(new LoginPage());
        }
    }
}

