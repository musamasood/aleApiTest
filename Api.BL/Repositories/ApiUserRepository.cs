using Api.DL;
using Api.DL.Entities;
using System;
using System.Web;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Helpers;

namespace Api.BL.Repositories
{
    public class ApiUserRepository
    {
        private DbRawSqlQuery<User> listado1;
        private DbRawSqlQuery<RelUserSchedule> listado2;

        public List<User> UserAll(string username = "", int pageSize = 10, int pageNumber = 1)
        {

            using (var db = new ApiDbContext())
            {


                listado1 = db.Database.SqlQuery<User>("exec sp_user_all {0}, {1}, {2}",
                username, pageSize, pageNumber);

                return listado1.ToList();

            }
        }
        public List<User> UserInsert(User user)
        {
            string salt = Crypto.GenerateSalt();
            string password = user.Password + salt;
            string hashedPass = Crypto.HashPassword(user.Password);


            using (var db = new ApiDbContext())
            {
               
                try
                {
                    listado1 = db.Database.SqlQuery<User>("exec sp_user_insert {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8},{9},{10}",
                    user.Dni, user.Email, user.PhoneNumber, user.Firstname, user.Lastname, user.Username,
                    user.Avatar, user.Color, user.NickName,user.RoleId, hashedPass);

                    return listado1.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }

        public List<User> UserUpdate(User user)
        {

            using (var db = new ApiDbContext())
            {

                try
                {
                    listado1 = db.Database.SqlQuery<User>("exec sp_user_update {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8},{9},{10},{11}",
                    user.Dni, user.Email,user.PhoneNumber, user.Firstname, user.Lastname, user.Username, user.Password,
                    user.Avatar, user.Color, user.NickName, user.RoleId, user.IsActivo);

                    return listado1.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        public bool UserDetete(string userlogin)
        {
            string result;
            using (var db = new ApiDbContext())
            {

                try
                {
                    result = db.Database.SqlQuery<string>("exec sp_user_delete {0}", userlogin).First();

                    if (result != "-1")
                        return true;
                    else
                        return false;

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }

        public bool UserChangePass(string username, string pass)
        {
            string result;
            using (var db = new ApiDbContext())
            {
                string salt = Crypto.GenerateSalt();
                string password = pass + salt;
                string hashedPass = Crypto.HashPassword(pass);

                try
                {
                    result = db.Database.SqlQuery<string>("exec sp_user_changePass {0},{1}", username, hashedPass).First();

                    if (result == "1")
                        return true;
                    else
                        return false;

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }

        public bool LoginUser(string username,string email, string pass)
        {
            
            using (var db = new ApiDbContext())
            {
              
                
                try
                {
                    string hashedPass2 = "";
                    bool isVerified = false;
                    hashedPass2 = db.Database.SqlQuery<string>("exec sp_user_login {0},{1}", username, email).First();

                    if (hashedPass2.Length > 1)
                    {
                                                                       
                        isVerified = Crypto.VerifyHashedPassword(hashedPass2, pass);
                        return isVerified;
                    }
                    
                    return isVerified;


                }
                catch (Exception)
                {

                    throw;
                }

            }
        }

        public bool RelScheduleUserInsert(int scheduleId, int userId)
        {
            string result;
            using (var db = new ApiDbContext())
            {

                try
                {

                    result = db.Database.SqlQuery<string>("exec sp_RelUserSchedules_insert {0}, {1}",
                    scheduleId, userId).First();

                    if (result != "-1")
                        return true;
                    else
                        return false;

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        public List<RelUserSchedule> RelUserSheduleAll(int sheduleId = 0, int pageSize = 10, int pageNumber = 1)
        {

            using (var db = new ApiDbContext())
            {


                listado2 = db.Database.SqlQuery<RelUserSchedule>("exec sp_RelUserShedule_all {0}, {1}, {2}",
                sheduleId, pageSize, pageNumber);

                return listado2.ToList();

            }
        }

    }
}
