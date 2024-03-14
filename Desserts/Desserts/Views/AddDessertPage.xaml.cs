using Dessert.Models;
using Desserts.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Desserts.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class AddDessertPage : ContentPage
	{
		public AddDessertPage (DessertModel model)
		{
			InitializeComponent ();
			BindingContext = new AddDessertViewModel(model);
		}

        private void back_Clicked(object sender, EventArgs e)
        {
			Navigation.PopAsync();
        }
    }
}