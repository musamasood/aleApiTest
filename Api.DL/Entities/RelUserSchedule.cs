using Api.DL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.DL.Entities
{
    public class RelUserSchedule: PropertiesCommon
    {
        public int ScheduleId { get; set; }
        public int UserId { get; set; }

    }
}
