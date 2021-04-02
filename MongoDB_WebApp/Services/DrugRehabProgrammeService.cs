using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB.Driver;

namespace MongoDB_WebApp.Services
{
    public class DrugRehabProgrammeService
    {
        private readonly IMongoCollection<DrugRehabProgramme> _DrugRehabProgramme;

        public DrugRehabProgrammeService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _DrugRehabProgramme = database.GetCollection<DrugRehabProgramme>(settings.DrugRehabProgrammeCollectionName);
        }

        public List<DrugRehabProgramme> Get() =>
            _DrugRehabProgramme.Find(DrugRehabProg => true).ToList();

        public DrugRehabProgramme Get(int ProgID) =>
            _DrugRehabProgramme.Find(DrugRehabProg => DrugRehabProg.ProgID == ProgID).FirstOrDefault();

        public DrugRehabProgramme Create(DrugRehabProgramme DrugRehabProg, int counter)
        {
            DrugRehabProg.ProgID = counter;
            _DrugRehabProgramme.InsertOne(DrugRehabProg);
            return DrugRehabProg;
        }

        public void Update(int ProgID, DrugRehabProgramme DrugRehabProgIn)
        {
            var targetDrugRehabProg = Get(ProgID);

            if (DrugRehabProgIn.ProgName != null)
                targetDrugRehabProg.ProgName = DrugRehabProgIn.ProgName;
            if (DrugRehabProgIn.ProgDescrip != null)
                targetDrugRehabProg.ProgDescrip = DrugRehabProgIn.ProgDescrip;
            if (DrugRehabProgIn.StartDate != null)
                targetDrugRehabProg.StartDate = DrugRehabProgIn.StartDate;
            if (DrugRehabProgIn.EndDate != null)
                targetDrugRehabProg.EndDate = DrugRehabProgIn.EndDate;

            _DrugRehabProgramme.ReplaceOne(DrugRehabProg => DrugRehabProg.ProgID == ProgID, DrugRehabProgIn);
        }

        public void Remove(int ProgID) =>
            _DrugRehabProgramme.DeleteOne(DrugRehabProg => DrugRehabProg.ProgID == ProgID);
    }
}
