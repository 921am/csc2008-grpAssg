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

        public DrugRehabProgramme Create(DrugRehabProgramme DrugRehabProg)
        {
            _DrugRehabProgramme.InsertOne(DrugRehabProg);
            return DrugRehabProg;
        }

        public void Update(int ProgID, DrugRehabProgramme DrugRehabProgIn) =>
            _DrugRehabProgramme.ReplaceOne(DrugRehabProg => DrugRehabProg.ProgID == ProgID, DrugRehabProgIn);

        public void Remove(DrugRehabProgramme DrugRehabProgIn) =>
            _DrugRehabProgramme.DeleteOne(DrugRehabProg => DrugRehabProg.ProgID == DrugRehabProgIn.ProgID);

        public void Remove(int ProgID) =>
            _DrugRehabProgramme.DeleteOne(DrugRehabProg => DrugRehabProg.ProgID == ProgID);
    }
}
