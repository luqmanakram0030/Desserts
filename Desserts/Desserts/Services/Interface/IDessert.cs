using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dessert.Models;

namespace Desserts.Services.Interface
{
	public interface IDessert
	{
        Task<bool> RegisterDessert(DessertModel model);
        Task<bool> UpdateDessert(DessertModel model);
        Task<bool> DeleteDessert(string key);

        Task<List<DessertModel>> GetDessertListByid(string id);
        Task<List<DessertModel>> GetAllDessertAsync();
    }
}

