using System;
using System.Collections.Generic;
using Desserts.ViewModels;
using Xamarin.Forms;

namespace Desserts.Views
{	
	public partial class ShoppingListPage : ContentPage
	{	
		public ShoppingListPage ()
		{
			InitializeComponent ();
			BindingContext = new ShoppingListViewModel();

        }
	}
}

