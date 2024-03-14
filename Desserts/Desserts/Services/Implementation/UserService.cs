using System;
using Desserts.Helpers;
using Desserts.Models;
using Desserts.Services.Interface;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Firebase.Database;
using System.Linq;
using Firebase.Database.Query;

namespace Desserts.Services.Implementation
{
    public class UserService : IUser
    {
        FirebaseClient firebase = new FirebaseClient(FirebaseWebApi.DatabaseLink, new FirebaseOptions
        {
            AuthTokenAsyncFactory = () => Task.FromResult(FirebaseWebApi.DatabaseSecret)
        });

        public async Task<bool> UpdateUser(ApplicationUser user)
        {
            try
            {
                string email = Preferences.Get("Email", "Test");
                var toUpdateclsUser = (await firebase
              .Child("clsUser")
              .OnceAsync<ApplicationUser>()).Where(a => a.Object.Email == email).FirstOrDefault();

                await firebase
                  .Child("clsUser")
                  .Child(toUpdateclsUser.Key)
                  .PutAsync(new ApplicationUser()
                  {
                      UserId = user.UserId,
                      Email = user.Email,
                      FullName = user.FullName,
                      Password = user.Password,
                      PhoneNumber = user.PhoneNumber,
                      Img = user.Img

                  });


                return true;
            }
            catch (Exception ex)
            {
                await App.Current.MainPage.DisplayAlert("Alert", ex.Message, "OK");
                return false;
            }



        }
        public async Task<bool> RegisterUser(ApplicationUser user)
        {
            var result = await firebase.Child(nameof(ApplicationUser)).PostAsync(new ApplicationUser()
            {
                UserId = Guid.NewGuid(),
                Email = user.Email,
                FullName = user.FullName,
                PhoneNumber = user.PhoneNumber,
                Password = user.Password

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
        public async Task<bool> DeleteUser(string email)
        {

            var task = (await firebase.Child(nameof(ApplicationUser)).OnceAsync<ApplicationUser>())
                .Where(a => a.Object.Email == email)
                .FirstOrDefault();

            if (task != null)
            {
                await firebase.Child(nameof(ApplicationUser)).Child(task.Key).DeleteAsync();
                return true;
            }
            else
            {
                return false;
            }
        }
        public async Task<ApplicationUser> LoginUser(string email, string password)
        {
            try
            {
                var GetPerson = (await firebase.Child(nameof(ApplicationUser)).OnceAsync<ApplicationUser>())
                .Where(a => a.Object.Email == email && a.Object.Password == password).FirstOrDefault();

                if (GetPerson != null)
                {

                    var content = GetPerson.Object as ApplicationUser;
                    return content;

                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                return null;
            }

        }

        //Get all the info of the clients
        public async Task<List<ApplicationUser>> GetInfo(string email)
        {
            var GetInfo = (await firebase.Child(nameof(ApplicationUser)).OnceAsync<ApplicationUser>()).Where(a => a.Object.Email.ToString() == email).Select(item => new ApplicationUser
            {
                UserId = item.Object.UserId,

                Email = item.Object.Email,
                FullName = item.Object.FullName,
                Password = item.Object.Password,
                PhoneNumber = item.Object.PhoneNumber,
                Img = item.Object.Img,
                // Key = item.Key

            });

            if (GetInfo != null)
            {
                List<ApplicationUser> user = new List<ApplicationUser>(GetInfo);
                return user;
            }
            else
            {
                return null;
            }
        }
        public async Task<List<ApplicationUser>> GetAllUsersAsync()
        {
            return (await firebase.Child(nameof(ApplicationUser)).OnceAsync<ApplicationUser>()).Select(f => new ApplicationUser
            {

                Email = f.Object.Email,
                FullName = f.Object.FullName,
                PhoneNumber = f.Object.PhoneNumber,
                UserId = f.Object.UserId,
            }).ToList();
        }
    }
}

