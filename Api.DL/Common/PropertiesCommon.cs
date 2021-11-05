using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.DL.Common
{
    public class PropertiesCommon : IPropertiesCommon
    {
        public int Id { get; set; }
        public DateTime DateCreate { get; set; }
        public DateTime DateUpdate { get; set; }
        public Boolean IsActivo { get; set; }

    }
}
