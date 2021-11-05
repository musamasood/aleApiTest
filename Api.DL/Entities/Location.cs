using Api.DL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.DL.Entities
{
    public class Location: PropertiesCommon
    {
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
