using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_API.Models;
using MongoDB.Driver;

namespace MongoDB_API.Services
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

        public AcadProgramme Create(AcadProgramme AcadProg, int counter)
        {
            AcadProg.ProgID = counter;
            _AcadProgramme.InsertOne(AcadProg);
            return AcadProg;
        }

        public void Update(int ProgID, AcadProgramme AcadProgIn)
        {
            var targetAcadProj = Get(ProgID);

            if (AcadProgIn.ProgName != null)
                targetAcadProj.ProgName = AcadProgIn.ProgName;
            if (AcadProgIn.ProgDescrip != null)
                targetAcadProj.ProgDescrip = AcadProgIn.ProgDescrip;
            if (AcadProgIn.StartDate != null)
                targetAcadProj.StartDate = AcadProgIn.StartDate;
            if (AcadProgIn.EndDate != null)
                targetAcadProj.EndDate = AcadProgIn.EndDate;

            _AcadProgramme.ReplaceOne(AcadProg => AcadProg.ProgID == ProgID, targetAcadProj);
        }
            
        public void Remove(int ProgID) =>
            _AcadProgramme.DeleteOne(AcadProg => AcadProg.ProgID == ProgID);

    }
}
