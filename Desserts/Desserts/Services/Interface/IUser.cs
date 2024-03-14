using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Desserts.Models;

namespace Desserts.Services.Interface
{
    public interface IUser
    {
        Task<bool> RegisterUser(ApplicationUser user);
        Task<bool> DeleteUser(string email);
        Task<bool> UpdateUser(ApplicationUser user);
        Task<ApplicationUser> LoginUser(string email, string password);
        Task<List<ApplicationUser>> GetInfo(string userId);
        Task<List<ApplicationUser>> GetAllUsersAsync();
    }
}

