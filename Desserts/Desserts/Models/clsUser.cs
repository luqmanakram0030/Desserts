using System;
namespace Desserts.Models
{
    public class ApplicationUser
    {
        public Guid UserId { get; set; }

        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Password { get; set; }
        public byte[] Img { get; set; }
    }
}

