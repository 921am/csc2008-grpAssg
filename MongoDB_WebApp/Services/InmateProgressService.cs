using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB.Driver;

namespace MongoDB_WebApp.Services
{
    public class InmateProgressService
    {
        private readonly IMongoCollection<InmateProgress> _InmateProgressService;

        public InmateProgressService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _InmateProgressService = database.GetCollection<InmateProgress>(settings.InmateProgressCollectionName);
        }

        public List<InmateProgress> Get() =>
            _InmateProgressService.Find(InmateProg => true).ToList();

        public InmateProgress Get(int InmateProgressID) =>
            _InmateProgressService.Find(InmateProg => InmateProg.InmateProgressID == InmateProgressID).FirstOrDefault();

        public InmateProgress Create(InmateProgress InmateProg)
        {
            _InmateProgressService.InsertOne(InmateProg);
            return InmateProg;
        }

        public void Update(int InmateProgressID, InmateProgress InmateProgIn) =>
            _InmateProgressService.ReplaceOne(InmateProg => InmateProg.InmateProgressID == InmateProgressID, InmateProgIn);

        public void Remove(InmateProgress InmateProgIn) =>
            _InmateProgressService.DeleteOne(InmateProg => InmateProg.InmateProgressID == InmateProgIn.InmateProgressID);

        public void Remove(int InmateProgressID) =>
            _InmateProgressService.DeleteOne(InmateProg => InmateProg.InmateProgressID == InmateProgressID);
    }
}
