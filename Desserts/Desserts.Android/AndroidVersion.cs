using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Desserts.Droid;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
[assembly: Xamarin.Forms.Dependency(typeof(AndroidVersion))]
namespace Desserts.Droid
{
    public class AndroidVersion : IAndroidVersion
    {
        public int Version()
        {
            int currentapiVersion = (int)Android.OS.Build.VERSION.SdkInt;
            return currentapiVersion;
        }
    }
}