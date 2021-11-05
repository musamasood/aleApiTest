using Api.BL.Repositories;
using Api.DL;
using Api.DL.Entities;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace aleApiTest.Controllers
{
    public class RelUserSchedulesController : ApiController
    {
        private ApiUserRepository _Repo;
        public RelUserSchedulesController()
        {
            _Repo = new ApiUserRepository();

        }

        // GET api/RelUserSchedules
        public IEnumerable<RelUserSchedule> Get()
        {

            using (var db = new ApiDbContext())
            {
                var sheduleList = _Repo.RelUserSheduleAll();
                return sheduleList.ToList();
            }

        }

        // GET api/RelUserSchedules/1   
        public IEnumerable<RelUserSchedule> Get(int sheduleId)
        {

            using (var db = new ApiDbContext())
            {
                var sheduleList = _Repo.RelUserSheduleAll(sheduleId, 10, 1);

                return sheduleList.ToList();
            }

        }

        // POST api/RelUserSchedules
        [HttpPost]
        public bool AddRel(int scheduleId, int userId)
        {

            using (var db = new ApiDbContext())
            {
                var insert = _Repo.RelScheduleUserInsert(scheduleId, userId);
                if (insert)
                    return true;
                else
                    return false;
            }

        }
    }
}
