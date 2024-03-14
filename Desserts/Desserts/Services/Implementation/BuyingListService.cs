using System;
using System.Collections.Generic;
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

        public Task<bool> DeleteBuyingList(string key)
        {
            throw new NotImplementedException();
        }

        public Task<List<Ingredient>> GetAllBuyingListAsync()
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdateBuyingList(Ingredient model)
        {
            throw new NotImplementedException();
        }
    }
}

