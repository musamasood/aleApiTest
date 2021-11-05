using Api.DL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.DL.Entities
{
    public class User: PropertiesCommon
    {
        public string Dni { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Avatar { get; set; }
        public string Color { get; set; }
        public string NickName { get; set; }
        public int  RoleId { get; set; }      
        public string PasswordHash { get; set; }
        public string PasswordHash_old { get; set; }


    }
}
