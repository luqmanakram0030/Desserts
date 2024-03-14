using Dessert.Models;
using Dessert.ViewModels;
using Desserts.ViewModels;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Desserts.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FavouritePage : ContentPage
    {
        public FavouriteViewModel vm;
        public FavouritePage()
        {
            InitializeComponent();
            BindingContext = vm = new FavouriteViewModel();
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            vm.IsBusy = false;
            vm.Busy = false;
            vm.dessertModels = new ObservableCollection<DessertModel>();
            vm.GetItems();
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
    }
}