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

        public Inmates Create(Inmates inmates)
        {
            _inmates.InsertOne(inmates);
            return inmates;
        }

        public void Update(int InmateID, Inmates inmateIn) =>
            _inmates.ReplaceOne(inmate => inmate.InmateID == InmateID, inmateIn);

        public void Remove(Inmates inmateIn) =>
            _inmates.DeleteOne(inmate => inmate.InmateID == inmateIn.InmateID);

        public void Remove(int InmateID) =>
            _inmates.DeleteOne(inmate => inmate.InmateID == InmateID);
    }
}
