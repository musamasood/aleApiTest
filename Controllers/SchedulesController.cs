using Api.BL.Repositories;
using Api.DL;
using Api.DL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace aleApiTest.Controllers
{
    [EnableCors(origins: "https://localhost:44356", headers: "*", methods: "*")]
    public class SchedulesController : ApiController
    {
        //private readonly ApiDbContext _context;

        //public SchedulesController(ApiDbContext context)
        //{
        //    _context = context;
        //}
        private AleApiRepository _Repo;
        //ApiDbContext BD = new ApiDbContext();

        public SchedulesController()
        {
            _Repo = new AleApiRepository();

        }


        /// <summary>
        /// Devuelve un listado de los eventos
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IEnumerable<Schedule> Get()
        {
            //var listado = BD.Schedules.ToList();
           
            using (var db = new ApiDbContext())
            {
                var sheduleList = _Repo.SheduleAll();
                return sheduleList.ToList();
            }

        }

        [HttpGet]
        public IEnumerable<Schedule> Get(int id)
        {

            using (var db = new ApiDbContext())
            {
                var sheduleList = _Repo.SheduleAll(id,10, 1);

                return sheduleList.ToList();
            }

        }

        [HttpPost]
        public IHttpActionResult Post([FromBody] Schedule schedule)
        {

            using (var db = new ApiDbContext())
            {
                try
                {
                    if(_Repo.SheduleInsert(schedule))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception ex)
                {

                    return BadRequest("Invalid data. "+ex);
                }
                
            }

        }

        //public IEnumerable<Schedule> Post([FromBody] Schedule schedule)
        //{

        //    using (var db = new ApiDbContext())
        //    {
        //        try
        //        {
        //            var sheduleList = _Repo.SheduleInsert(schedule);
        //            return sheduleList.ToList();
        //        }
        //        catch (Exception)
        //        {

        //            throw;
        //        }

        //    }

        //}


        [HttpPut]
        public IHttpActionResult Put(Schedule schedule)
        {

            using (var db = new ApiDbContext())
            {
                try
                {
                    if(_Repo.SheduleUpdate(schedule))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception ex)
                {

                    return BadRequest("Invalid data. " + ex);
                }

            }

        }
        [HttpDelete]
        public IHttpActionResult Delete(int id)
        {

            using (var db = new ApiDbContext())
            {
                try
                {
                    if (_Repo.SheduleDetete(id))
                        return Ok();
                    else
                        return BadRequest();
                }
                catch (Exception ex)
                {
                    return BadRequest("Invalid data. " + ex);
                }
            }
        }
    } 
}
