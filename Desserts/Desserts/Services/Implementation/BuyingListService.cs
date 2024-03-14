using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dessert.Models;
using Desserts.Helpers;
using Desserts.Models;
using Desserts.Services.Interface;
using Firebase.Database;
using Firebase.Database.Query;
using Xamarin.Forms;

namespace Desserts.Services.Implementation
{
	public class BuyingListService: IBuyingList
    {
        FirebaseClient firebase = new FirebaseClient(FirebaseWebApi.DatabaseLink, new FirebaseOptions
        {
            AuthTokenAsyncFactory = () => Task.FromResult(FirebaseWebApi.DatabaseSecret)
        });

        public async Task<bool> CreateBuyingList(Ingredient model)
        {
            try
            {
                var result = await firebase.Child(nameof(Ingredient)).PostAsync(new Ingredient()
                {
                    id = model.id,
                  Heading=model.Heading,
                  HeadingDescription=model.HeadingDescription,
                  HeadingDescVisible=model.HeadingDescVisible,
                  description=model.description,
                  Wight=model.Wight,
                  UOM=model.UOM,

                });

                


                if (result.Object != null)
                {

                   
                    return true;
                }
                else
                {
                    return false;

                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> DeleteBuyingList(string key)
        {
            try
            {
                await firebase.Child(nameof(Ingredient)).Child(key).DeleteAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<List<Ingredient>> GetAllBuyingListAsync()
        {
            try
            {
                return (await firebase.Child(nameof(Ingredient)).OnceAsync<Ingredient>()).Select(f => new Ingredient
                {
                 
                    id =f.Object.id,
                    Heading = f.Object.Heading,
                    HeadingDescription = f.Object.HeadingDescription,
                    HeadingDescVisible = f.Object.HeadingDescVisible,
                    description = f.Object.description,
                    Wight = f.Object.Wight,
                    UOM = f.Object.UOM,
                    Key=f.Key,
                }).ToList();

            }
            catch (Exception ex)
            {
                await App.Current.MainPage.DisplayAlert("", ex.Message, "OK");
                return null;
            }
        }

        public Task<bool> UpdateBuyingList(Ingredient model)
        {
            throw new NotImplementedException();
        }
    }
}

