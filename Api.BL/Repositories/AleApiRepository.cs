using Api.DL;
using Api.DL.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.BL.Repositories
{
    public class AleApiRepository
    {
        private DbRawSqlQuery<Schedule> listado1;

        public List<Schedule> SheduleAll( int id=0, int pageSize = 10, int pageNumber = 1)
        {

            using (var db = new ApiDbContext())
            {

                
                listado1 = db.Database.SqlQuery<Schedule>("exec sp_schedules_all {0}, {1}, {2}",
                id, pageSize, pageNumber);

                return listado1.ToList();

            }
        }
        public List<Schedule> SheduleInsert(Schedule schedule)
        {

            using (var db = new ApiDbContext())
            {

                try
                {
                    listado1 = db.Database.SqlQuery<Schedule>("exec sp_schedules_insert {0}, {1}, {2}, {3}, {4}, {5}",
                    schedule.Description, schedule.WeekSelect,schedule.TimeInit,schedule.TimeEnd,schedule.CoachId,
                    schedule.LocationId);

                    return listado1.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }

        public List<Schedule> SheduleUpdate(Schedule schedule)
        {

            using (var db = new ApiDbContext())
            {

                try
                {
                    listado1 = db.Database.SqlQuery<Schedule>("exec sp_schedules_update {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}",
                    schedule.Id, schedule.Description, schedule.WeekSelect, schedule.TimeInit, schedule.TimeEnd, schedule.CoachId,
                    schedule.LocationId);

                    return listado1.ToList();

                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        public bool SheduleDetete(int id)
        {
            string result;
            using (var db = new ApiDbContext())
            {

                try
                {
                    result = db.Database.SqlQuery<string>("exec sp_schedules_delete {0}",id).First();

                    if (result!= "-1")
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
    }
}
