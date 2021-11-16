using aleApiTest.Models;
using System;
using System.Collections.Generic;
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
        private aleoApiTestEntities db = new aleoApiTestEntities();

        // POST api/Login/UserLogin
        [ResponseType(typeof(Login))]
        public IHttpActionResult PostUserLogin(string username, string password)
        {
            //ClaimsIdentity ci = new ClaimsIdentity();
            var checkuser = db.users.Where(x => x.userUsername == username && x.userPassword == password).FirstOrDefault();
            if (checkuser != null)
            {
                Console.WriteLine("CORRECT UserName and Password");
            }
            else
            {
                Console.WriteLine("INCORRECT UserName or Password");
            }
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}

