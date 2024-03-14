using Dessert.Models;
using Dessert.ViewModels;
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
    public partial class MyDessertsPage : ContentPage
    {

        public DashboardViewModel vm;
        public MyDessertsPage()
        {
            InitializeComponent();
            BindingContext = vm = new DashboardViewModel(this);
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            vm.IsBusy = false;
            vm.Busy = false;
            vm.dessertModels = new ObservableCollection<DessertModel>();
            vm.GetMyItems();
        }
        private void Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(e.NewTextValue))
            {
                //vm.tempList = new ObservableCollection<DessertModel>();
                //vm.GetMyItems();
                dessertlist.ItemsSource = vm.dessertModels;
            }
            else
            {
                dessertlist.ItemsSource = vm.dessertModels.Where(i => i.name.ToLower().Contains(e.NewTextValue.ToLower()));
            }
        }

    }
}