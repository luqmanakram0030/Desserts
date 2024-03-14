using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using Dessert.Models;
using Xamarin.CommunityToolkit.UI.Views;
using Xamarin.Forms;

namespace Desserts.Views
{	
	public partial class DessertDetailPopup : Popup
    {
        private DessertModel dessert;

        public DessertDetailPopup (DessertModel dessert)
		{
			InitializeComponent ();
            
            this.dessert = dessert;
            img.Source = dessert.imagesrc;
            name.Text = dessert.name;
            des.Text = dessert.description;
            time.Text = dessert.time;
            Def.Text = dessert.difficulty;
            ingredientListView.ItemsSource = dessert.ingredientModels;
        }
        void Button_Clicked(System.Object sender, System.EventArgs e)
        {
            this.Dismiss(e);
        }
    }
}

