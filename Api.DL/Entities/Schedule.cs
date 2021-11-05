using Api.DL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.DL.Entities
{
    public class Schedule: PropertiesCommon
    {
        public string Description { get; set; }
        public Byte WeekSelect { get; set; }
        public DateTime TimeInit { get; set; }
        public DateTime TimeEnd { get; set; }
        public int LocationId { get; set; }
        public int CoachId { get; set; }
        //public IEnumerable<User> UserId { get; set; }
        
        

    }
}
