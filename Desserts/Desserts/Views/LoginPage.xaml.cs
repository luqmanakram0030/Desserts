using System;
using System.Collections.Generic;
using Desserts.ViewModels;
using Xamarin.Forms;

namespace Desserts.Views
{	
	public partial class LoginPage : ContentPage
	{	
		public LoginPage ()
		{
			InitializeComponent ();
            BindingContext = new LoginViewModel();
        }
	}
}

