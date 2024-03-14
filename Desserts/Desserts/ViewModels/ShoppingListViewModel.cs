using System;
using System.Collections.Generic;
using System.Windows.Input;
using Dessert.ViewModels;
using Desserts.Models;
using Desserts.Services.Interface;
using Desserts.Views;
using Rg.Plugins.Popup.Extensions;
using Xamarin.Forms;

namespace Desserts.ViewModels
{
	public class ShoppingListViewModel:BaseViewModel
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
        private List<Ingredient> _ing;

        public List<Ingredient> Ingredientlist
        {
            get { return _ing; }
            set { _ing = value; OnpropertyChanged(); }
        }
        public ICommand DeleteFromCartCMD { get; set; }
        private readonly IBuyingList _ShopinglistService;
        public ShoppingListViewModel()
		{
            _ShopinglistService = DependencyService.Resolve<IBuyingList>();
            LoafDefault();

            DeleteFromCartCMD = new Command(DeleteFromCartAsync);
        }
        public async void DeleteFromCartAsync(object obj)
        {
            try
            {
                var item = obj as Ingredient;

                bool result = await _ShopinglistService.DeleteBuyingList(item.Key);
                if (result)
                {
                    await Application.Current.MainPage.DisplayAlert("Success", "Successfully Deleted from List!", "ok");
                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Something Wrong!", "ok");
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("", ex.Message, "Ok");
            }
        }

        private async void LoafDefault()
        {
            Ingredientlist = await _ShopinglistService.GetAllBuyingListAsync();
        }
    }
}

