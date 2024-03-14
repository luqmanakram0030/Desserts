using System;
using Desserts.Helpers;
using Firebase.Database;
using System.Collections.Generic;
using System.Threading.Tasks;
using Desserts.Services.Interface;
using Dessert.Models;
using System.Linq;
using Firebase.Database.Query;
using System.Reactive;
using Xamarin.Essentials;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using FirebaseAdmin.Messaging;
using System.IO;
using Xamarin.Forms;

namespace Desserts.Services.Implementation
{
	public class DessertService:IDessert
	{
        FirebaseClient firebase = new FirebaseClient(FirebaseWebApi.DatabaseLink, new FirebaseOptions
        {
            AuthTokenAsyncFactory = () => Task.FromResult(FirebaseWebApi.DatabaseSecret)
        });
        
       

        public async Task<bool> RegisterDessert(DessertModel model)
        {
            try
            {
                var result = await firebase.Child(nameof(DessertModel)).PostAsync(new DessertModel()
                {
                    id = model.id,
                    email = model.email,
                    name = model.name,
                    description = model.description,
                    ingredientModels = model.ingredientModels,
                    time = model.time,
                    difficulty = model.difficulty,
                    DessertImages = model.DessertImages,
                    imagesrc = model.imagesrc,
                    BookMarks = model.BookMarks,
                    Comments = model.Comments

                });
                
                // Response is a message ID string.
               
           
                if (result.Object != null)
                {

                    if (Device.RuntimePlatform == Device.Android)
                    {
                        DependencyService.Get<INotification>().Show(model);
                    }
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

        public async Task<bool> UpdateDessert(DessertModel model)
        {
            try
            {
                await firebase.Child(nameof(DessertModel)).Child(model.Key).PutAsync(new DessertModel()
                {
                    id = model.id,
                    email = model.email,
                    name = model.name,
                    description = model.description,
                    ingredientModels = model.ingredientModels,
                    time = model.time,
                    difficulty = model.difficulty,
                    DessertImages = model.DessertImages,
                    imagesrc = model.imagesrc,
                    BookMarks = model.BookMarks,
                    Comments = model.Comments
                });
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public async Task<bool> DeleteDessert(string Key)
        {
            try
            {
                await firebase.Child(nameof(DessertModel)).Child(Key).DeleteAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Task<List<DessertModel>> GetDessertListByid(string id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<DessertModel>> GetAllDessertAsync()
        {
            try
            {
                return (await firebase.Child(nameof(DessertModel)).OnceAsync<DessertModel>()).Select(f => new DessertModel
                {
                    id = f.Object.id,
                    email = f.Object.email,
                    name=f.Object.name,
                    description = f.Object.description,
                    ingredientModels = f.Object.ingredientModels,
                    time = f.Object.time,
                    difficulty = f.Object.difficulty,
                    imagesrc = f.Object.imagesrc,
                    DessertImages=f.Object.DessertImages,
                    BookMarks = f.Object.BookMarks,
                    Comments = f.Object.Comments,
                    Key = f.Key
                }).ToList();

            }
            catch (Exception ex)
            {
                await App.Current.MainPage.DisplayAlert("", ex.Message, "OK");
                return null;
            }
        }
    }
}

