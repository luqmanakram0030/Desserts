using Dessert.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace Desserts.Models
{
	public class Ingredient : BaseViewModel
	{
        public string Key { get; set; }
        public int id { get; set; }
		private string _Heading;

		public string Heading
        {
			get { return _Heading; }
			set { _Heading = value; OnpropertyChanged(); }
		}
		private double _Wight;

		public double Wight
        {
			get { return _Wight; }
			set { _Wight = value; OnpropertyChanged(); }
		}
		public  double WightforSingle { set; get; }
		private string _UOM;

		public string UOM
        {
			get { return _UOM; }
			set { _UOM = value; OnpropertyChanged(); }
		}
		private string _HeadingDescription;

		public string HeadingDescription
        {
			get { return _HeadingDescription; }
			set { _HeadingDescription = value; OnpropertyChanged(); }
		}

		//public string Heading { get; set; }
		//public string HeadingDescription { get; set; }
		public bool HeadingVisible { get; set; }
		public bool HeadingDescVisible { get; set; }

        private string _description;

        public string description
        {
            get { return _description; }
            set { _description = value; OnpropertyChanged(); }
        }

        //public string description { get; set; }

	}
}
