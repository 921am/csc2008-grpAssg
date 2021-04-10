using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_API.Models;
using MongoDB.Driver;

namespace MongoDB_API.Services
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

        public VocationalProgramme Create(VocationalProgramme VocationalProg, int counter)
        {
            VocationalProg.ProgID = counter;
            _VocationalProgramme.InsertOne(VocationalProg);
            return VocationalProg;
        }

        public void Update(int ProgID, VocationalProgramme VocationalProgIn)
        {
            var targetVocationalProj = Get(ProgID);

            if (VocationalProgIn.ProgName != null)
                targetVocationalProj.ProgName = VocationalProgIn.ProgName;
            if (VocationalProgIn.ProgDescrip != null)
                targetVocationalProj.ProgDescrip = VocationalProgIn.ProgDescrip;
            if (VocationalProgIn.StartDate != null)
                targetVocationalProj.StartDate = VocationalProgIn.StartDate;
            if (VocationalProgIn.EndDate != null)
                targetVocationalProj.EndDate = VocationalProgIn.EndDate;

            _VocationalProgramme.ReplaceOne(VocationalProg => VocationalProg.ProgID == ProgID, targetVocationalProj);
        } 

        public void Remove(int ProgID) =>
            _VocationalProgramme.DeleteOne(VocationalProg => VocationalProg.ProgID == ProgID);
    }
}
