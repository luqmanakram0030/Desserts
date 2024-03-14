using System;
using Dessert.Models;

namespace Desserts
{
	public interface INotification
	{
        void Show(DessertModel model);
    }
}

