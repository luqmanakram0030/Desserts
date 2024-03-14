using System;
using System.Collections.Generic;
using Desserts.ViewModels;
using Xamarin.Forms;

namespace Desserts.Views
{	
	public partial class RegisterPage : ContentPage
	{	
		public RegisterPage ()
		{
			InitializeComponent ();
            BindingContext = new UserSignupViewModel();
        }
	}
}

