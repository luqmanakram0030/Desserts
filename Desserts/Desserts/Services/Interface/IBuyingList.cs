using System;
using Dessert.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using Desserts.Models;

namespace Desserts.Services.Interface
{
	public interface IBuyingList
	{
        Task<bool> CreateBuyingList(Ingredient model);
        Task<bool> UpdateBuyingList(Ingredient model);
        Task<bool> DeleteBuyingList(string key);

       
        Task<List<Ingredient>> GetAllBuyingListAsync();
    }
}

