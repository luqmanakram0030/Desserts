using Dessert.ViewModels;
using Desserts.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Xamarin.Forms;

namespace Dessert.Models
{
	public class DessertModel:BaseViewModel
	{
        public string Key { get; set; }
        public int id { get; set; }
		public string email { get; set; }
		public string name { get; set; }
		public string description { get; set; }
		private bool _isExpanded;

		public bool isExpanded
        {
			get { return _isExpanded; }
			set { _isExpanded = value; OnpropertyChanged(); }
		}

		public ObservableCollection<Ingredient> ingredientModels { get; set; }
        public string time { get; set; }
		public string difficulty { get; set; }
        public string imagesrc { get; set; }
        public ImageSource image { get; set; }
		private ImageSource _fav_image;

		public ImageSource fav_image
        {
			get { return _fav_image; }
			set { _fav_image = value; OnpropertyChanged(); }
		}

		public List<string> DessertImages { get; set; }
        public List<CommentsModel> Comments { get; set; }
        public List<BokkMarkModel> BookMarks { get; set; }
    }
	public class CommentsModel
	{
        public string Email { get; set; }
        public string comment { get; set; }
    }
	public class BokkMarkModel
	{
        public string Email { get; set; }
    }
}

