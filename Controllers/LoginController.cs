using aleApiTest.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.UI.WebControls;

namespace aleApiTest.Controllers
{
    public class LoginController : ApiController
    {
        public aleoApiTestEntities db = new aleoApiTestEntities();
        
        // POST api/Login/UserLogin
        [ResponseType(typeof(Login))]
        public IHttpActionResult GetUserLogin(string username, string password)
        {
            //var uio = db.users.ToList();
            //try
            //{
                var checkuser = db.users.Where(x => x.userUsername == username && x.userPassword == password).FirstOrDefault();

                if (checkuser != null)
                {
                   // Console.WriteLine("CORRECT UserName and Password");
                return Ok("CORRECT UserName and Password");
            }
                else
                {
                return Ok("INCORRECT UserName or Password");
             }
            //}
            //catch (Exception e)
            //{
            //   // return View("Error");
            //}

            return Ok(checkuser);
        }
    }
}

