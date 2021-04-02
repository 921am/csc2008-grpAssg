using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MongoDB_WebApp.Models
{
    public class PrisonDatabaseSettings : IPrisonDatabaseSettings
    {
        public string InmatesCollectionName { get; set; }
        public string UsersCollectionName { get; set; }
        public string AcadProgrammeCollectionName { get; set; }
        public string DrugRehabProgrammeCollectionName { get; set; }
        public string VocationalProgrammeCollectionName { get; set; }
        public string InmateProgressCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }

    public interface IPrisonDatabaseSettings
    {
        string InmatesCollectionName { get; set; }
        public string UsersCollectionName { get; set; }
        public string AcadProgrammeCollectionName { get; set; }
        public string DrugRehabProgrammeCollectionName { get; set; }
        public string VocationalProgrammeCollectionName { get; set; }
        public string InmateProgressCollectionName { get; set; }
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}
