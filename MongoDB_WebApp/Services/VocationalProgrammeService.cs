using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB.Driver;

namespace MongoDB_WebApp.Services
{
    public class VocationalProgrammeService
    {
        private readonly IMongoCollection<VocationalProgramme> _VocationalProgramme;

        public VocationalProgrammeService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _VocationalProgramme = database.GetCollection<VocationalProgramme>(settings.VocationalProgrammeCollectionName);
        }

        public List<VocationalProgramme> Get() =>
            _VocationalProgramme.Find(VocationalProg => true).ToList();

        public VocationalProgramme Get(int ProgID) =>
            _VocationalProgramme.Find(VocationalProg => VocationalProg.ProgID == ProgID).FirstOrDefault();

        public VocationalProgramme Create(VocationalProgramme VocationalProg)
        {
            _VocationalProgramme.InsertOne(VocationalProg);
            return VocationalProg;
        }

        public void Update(int ProgID, VocationalProgramme VocationalProgIn) =>
            _VocationalProgramme.ReplaceOne(VocationalProg => VocationalProg.ProgID == ProgID, VocationalProgIn);

        public void Remove(VocationalProgramme VocationalProgIn) =>
            _VocationalProgramme.DeleteOne(VocationalProg => VocationalProg.ProgID == VocationalProgIn.ProgID);

        public void Remove(int ProgID) =>
            _VocationalProgramme.DeleteOne(VocationalProg => VocationalProg.ProgID == ProgID);
    }
}
