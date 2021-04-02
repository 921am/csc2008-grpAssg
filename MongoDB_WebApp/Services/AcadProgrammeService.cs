using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB.Driver;

namespace MongoDB_WebApp.Services
{
    public class AcadProgrammeService
    {
        private readonly IMongoCollection<AcadProgramme> _AcadProgramme;

        public AcadProgrammeService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _AcadProgramme = database.GetCollection<AcadProgramme>(settings.AcadProgrammeCollectionName);
        }

        public List<AcadProgramme> Get() =>
            _AcadProgramme.Find(AcadProg => true).ToList();

        public AcadProgramme Get(int ProgID) =>
            _AcadProgramme.Find(AcadProg => AcadProg.ProgID == ProgID).FirstOrDefault();

        public AcadProgramme Create(AcadProgramme AcadProg)
        {
            _AcadProgramme.InsertOne(AcadProg);
            return AcadProg;
        }

        public void Update(int ProgID, AcadProgramme AcadProgIn) =>
            _AcadProgramme.ReplaceOne(AcadProg => AcadProg.ProgID == ProgID, AcadProgIn);

        public void Remove(AcadProgramme AcadProgIn) =>
            _AcadProgramme.DeleteOne(AcadProg => AcadProg.ProgID == AcadProgIn.ProgID);

        public void Remove(int ProgID) =>
            _AcadProgramme.DeleteOne(AcadProg => AcadProg.ProgID == ProgID);

    }
}
