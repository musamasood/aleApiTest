using Api.BL.Repositories;
using Api.DL;
using Api.DL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace aleApiTest.Controllers
{
    public class UsersController : ApiController
    {
        private ApiUserRepository _Repo;
        public UsersController()
        {
            _Repo = new ApiUserRepository();

        }

        /// <summary>
        /// Devuelve un listado del calendario
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IEnumerable<User> Get()
        {
            //var listado = BD.Schedules.ToList();

            using (var db = new ApiDbContext())
            {
                var userList = _Repo.UserAll();
                return userList.ToList();
            }

        }

        [HttpGet]
        public IEnumerable<User> Get(string username)
        {

            using (var db = new ApiDbContext())
            {
                var userList = _Repo.UserAll(username, 10, 1);

                return userList.ToList();
            }

        }
       

        [HttpPost]
        public IEnumerable<User> Post([FromBody] User user)
        {
          
            using (var db = new ApiDbContext())
            {
                try
                {

                    var userList = _Repo.UserInsert(user);
                    return userList.ToList();
                }
                catch (Exception)
                {

                    throw;
                }

            }

        }


        [HttpPost]
        [Route("api/Login")]
        public bool Login([FromBody] User user)
        {

            using (var db = new ApiDbContext())
            {
                var loginOk = _Repo.LoginUser(user.Username,user.Email, user.Password);
                if (loginOk)
                    return true;
                else
                    return false;
            }

        }

        [HttpPut]
        public IEnumerable<User> Put(User user)
        {

            using (var db = new ApiDbContext())
            {
                try
                {
                    var userList = _Repo.UserUpdate(user);
                    return userList.ToList();
                }
                catch (Exception)
                {

                    throw;
                }

            }

        }
        [HttpPut]
        [Route("api/ChangePass")]
        public bool ChangePass([FromBody] User user)
        {

            using (var db = new ApiDbContext())
            {
                try
                {

                    var userChangePass = _Repo.UserChangePass(user.Username, user.Password);
                    if (userChangePass)
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
        [HttpDelete]
        public bool Delete(string username)
        {

            using (var db = new ApiDbContext())
            {
                var userBorrado = _Repo.UserDetete(username);
                if (userBorrado)
                    return true;
                else
                    return false;
            }

        }

        

    }
}
