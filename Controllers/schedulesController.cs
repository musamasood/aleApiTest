using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using aleApiTest.Models;

namespace aleApiTest.Controllers
{
    public class schedulesController : ApiController
    {
        private aleoApiTestEntities db = new aleoApiTestEntities();

        // GET: api/schedules
        public IQueryable<schedule> Getschedules()
        {
            return db.schedules;
        }

        // GET: api/schedules/5
        [ResponseType(typeof(schedule))]
        public IHttpActionResult Getschedule(int id)
        {
            schedule schedule = db.schedules.Find(id);
            if (schedule == null)
            {
                return NotFound();
            }

            return Ok(schedule);
        }

        // PUT: api/schedules/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putschedule(int id, schedule schedule)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != schedule.idSchedule)
            {
                return BadRequest();
            }

            db.Entry(schedule).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!scheduleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/schedules
        [ResponseType(typeof(schedule))]
        public IHttpActionResult Postschedule(schedule schedule)
        {
            
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.schedules.Add(schedule);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = schedule.idSchedule }, schedule);
        }

        // DELETE: api/schedules/5
        [ResponseType(typeof(schedule))]
        public IHttpActionResult Deleteschedule(int id)
        {
            schedule schedule = db.schedules.Find(id);
            if (schedule == null)
            {
                return NotFound();
            }

            db.schedules.Remove(schedule);
            db.SaveChanges();

            return Ok(schedule);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool scheduleExists(int id)
        {
            return db.schedules.Count(e => e.idSchedule == id) > 0;
        }
    }
}