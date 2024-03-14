using System;
using Android.Widget;
using Desserts.Droid;

[assembly: Xamarin.Forms.Dependency(typeof(Toast_Android))]
namespace Desserts.Droid
{
    public class Toast_Android : Toast
    {
        public void Show(string message)
        {
            Android.Widget.Toast.MakeText(Android.App.Application.Context, message, ToastLength.Short).Show();
        }
    }
}

