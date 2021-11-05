using Api.DL.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.Entity.Infrastructure;
using System.Data.Common;

namespace Api.DL
{

        public class ApiDbContext : DbContext
        {
            public DbSet<Coach> Coachs { get; set; }
            public DbSet<Location> Locations { get; set; }
            public DbSet<Role> Roles { get; set; }
            public DbSet<Schedule> Schedules { get; set; }
            public DbSet<User> Users { get; set; }
            public DbSet<RelUserSchedule> RelUserSchedule { get; set; }

        public ApiDbContext()
            : base(ConfigurationManager.AppSettings["tipobdd"].ToString())
            {
                ((IObjectContextAdapter)this).ObjectContext.CommandTimeout = 900000;
            }

            public ApiDbContext(DbConnection existingConnection, bool contextOwnsConnection)
          : base(existingConnection, contextOwnsConnection)
            {

            }
            protected override void OnModelCreating(DbModelBuilder modelBuilder)
            {
                Database.SetInitializer<ApiDbContext>(null);
                base.OnModelCreating(modelBuilder);
            }
    }
}
