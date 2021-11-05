using Api.DL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.DL.Entities
{
    public class Coach: PropertiesCommon
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Dni { get; set; }
        public string Description { get; set; }

    }
}
