using Api.BL.Repositories;
using Api.DL;
using Api.DL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace aleApiTest.Controllers
{
    [EnableCors(origins: "https://localhost:44356",headers:"*",methods:"*")]
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
                catch (Exception err)
                {

                    throw err;
                }

            }

        }


        [HttpPost]
        [Route("api/Login")]
        public IHttpActionResult Login([FromBody] User user)
        {
            using (var db = new ApiDbContext())
            {
                try
                {

                    if(_Repo.LoginUser(user.Username,user.Password))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception err)
                {

                    throw err;
                }
            }

        }

        [HttpPut]
        public IHttpActionResult Put(User user)
        {
            using (var db = new ApiDbContext())
            {
                try
                {
                    if (_Repo.UserUpdate(user))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception err)
                {

                    throw err;
                }

            }

        }
        [HttpPut]
        [Route("api/ChangePass")]
        public IHttpActionResult ChangePass([FromBody] User user)
        {

            using (var db = new ApiDbContext())
            {
                try
                {

                    if(_Repo.UserChangePass(user.Username, user.Password))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception err)
                {

                    throw err;
                }

            }

        }
        [HttpDelete]
        public IHttpActionResult Delete(string username)
        {

            using (var db = new ApiDbContext())
            {
                try
                {
                    if (_Repo.UserDetete(username))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception err)
                {

                    throw err;
                }
            }

        }

        

    }
}
