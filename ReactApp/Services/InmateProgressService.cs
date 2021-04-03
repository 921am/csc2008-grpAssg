using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ReactApp.Models;
using MongoDB.Driver;

namespace ReactApp.Services
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

        public InmateProgress Create(InmateProgress InmateProg, int counter)
        {
            InmateProg.InmateProgressID = counter;
            _InmateProgressService.InsertOne(InmateProg);
            return InmateProg;
        }

        public void Update(int InmateProgressID, InmateProgress InmateProgIn)
        {
            var targetInmateProgress = Get(InmateProgressID);

            if (InmateProgIn.RehabProgID != 0)
                targetInmateProgress.RehabProgID = InmateProgIn.RehabProgID;
            if (InmateProgIn.RehabProgStatus != null)
                targetInmateProgress.RehabProgStatus = InmateProgIn.RehabProgStatus;
            if (InmateProgIn.AcadProgID != 0)
                targetInmateProgress.AcadProgID = InmateProgIn.AcadProgID;
            if (InmateProgIn.AcadProgStatus != null)
                targetInmateProgress.AcadProgStatus = InmateProgIn.AcadProgStatus;
            if (InmateProgIn.VocProgID != 0)
                targetInmateProgress.VocProgID = InmateProgIn.VocProgID;
            if (InmateProgIn.VocProgStatus != null)
                targetInmateProgress.VocProgStatus = InmateProgIn.VocProgStatus;
            if (InmateProgIn.InmateID != 0)
                targetInmateProgress.InmateID = InmateProgIn.InmateID;

            _InmateProgressService.ReplaceOne(InmateProg => InmateProg.InmateProgressID == InmateProgressID, targetInmateProgress);
        }

        public void Remove(int InmateProgressID) =>
            _InmateProgressService.DeleteOne(InmateProg => InmateProg.InmateProgressID == InmateProgressID);
    }
}
