using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using Android.Widget;
using Dessert.Models;
using Desserts.Droid;
using Firebase.Auth;
using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using Google.Apis.Auth.OAuth2;
using static Android.Graphics.ColorSpace;

[assembly: Xamarin.Forms.Dependency(typeof(PushNotificationService))]
namespace Desserts.Droid
{
	public class PushNotificationService: INotification
    {
        public void Show(DessertModel model)
        {
            var assem = Assembly.GetExecutingAssembly();
            //using var stream = assem.GetManifestResourceStream("BluetoothPrintApp.Resources.Images.branch.png");
            
            Stream stream = assem.GetManifestResourceStream("Desserts.Droid.Assets.private_key.json");
            string jsonString = "";
            using (var reader = new System.IO.StreamReader(stream))
            {
                jsonString = reader.ReadToEnd();
            }

            if (FirebaseMessaging.DefaultInstance == null)
            {
                FirebaseApp.Create(new AppOptions()
                {
                    Credential = GoogleCredential.FromJson(jsonString)
                });
            }

            // This registration token comes from the client FCM SDKs.
            //var registrationToken = "TOKEN_HERE";

            // See documentation on defining a message payload.
            var message = new Message()
            {
                Data = new Dictionary<string, string>()
                {
                    { "myData", "1337" },
                },
                //Token = registrationToken,
                Topic = "all",
                Notification = new Notification()
                {
                    Title = model.name,
                    Body = model.description
                }
            };

            // Send a message to the device corresponding to the provided
            // registration token.
            string response = FirebaseMessaging.DefaultInstance.SendAsync(message).Result;
        }
    }
}

