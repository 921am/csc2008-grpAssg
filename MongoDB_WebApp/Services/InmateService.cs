using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB.Driver;

namespace MongoDB_WebApp.Services
{
    public class InmateService
    {
        private readonly IMongoCollection<Inmates> _inmates;

        public InmateService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _inmates = database.GetCollection<Inmates>(settings.InmatesCollectionName);
        }

        public List<Inmates> Get() =>
            _inmates.Find( inmate => true).ToList();

        public Inmates Get(int InmateID) =>
            _inmates.Find(inmate => inmate.InmateID == InmateID).FirstOrDefault();

        public Inmates Create(Inmates inmates, int counter)
        {
            inmates.InmateID = counter;
            _inmates.InsertOne(inmates);
            return inmates;
        }

        public void Update(int InmateID, Inmates inmateIn)
        {
            var targetInmate = Get(InmateID);

            targetInmate.DrugOffender = inmateIn.DrugOffender;
            if (inmateIn.InmateName != null)
                targetInmate.InmateName = inmateIn.InmateName;
            if (inmateIn.Gender != null)
                targetInmate.Gender = inmateIn.Gender;
            if (inmateIn.DateEntered != null)
                targetInmate.DateEntered = inmateIn.DateEntered;
            if (inmateIn.DateReleased != null)
                targetInmate.DateReleased = inmateIn.DateReleased;

            _inmates.ReplaceOne(inmate => inmate.InmateID == InmateID, inmateIn);
        }

        public void Remove(int InmateID) =>
            _inmates.DeleteOne(inmate => inmate.InmateID == InmateID);
    }
}
