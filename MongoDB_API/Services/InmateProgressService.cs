using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_API.Models;
using MongoDB.Driver;

namespace MongoDB_API.Services
{
    public class InmateProgressService
    {
        private readonly IMongoCollection<InmateProgress> _InmateProgressService;
        private readonly IMongoCollection<DrugRehabProgramme> _DrugRehabProgrammeService;
        private readonly IMongoCollection<AcadProgramme> _AcadProgrammeService;
        private readonly IMongoCollection<VocationalProgramme> _VocationalProgrammeService;
        private readonly IMongoCollection<Inmates> _Inmates;

        public InmateProgressService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _InmateProgressService = database.GetCollection<InmateProgress>(settings.InmateProgressCollectionName);
            _DrugRehabProgrammeService = database.GetCollection<DrugRehabProgramme>(settings.DrugRehabProgrammeCollectionName);
            _AcadProgrammeService = database.GetCollection<AcadProgramme>(settings.AcadProgrammeCollectionName);
            _VocationalProgrammeService = database.GetCollection<VocationalProgramme>(settings.VocationalProgrammeCollectionName);
            _Inmates = database.GetCollection<Inmates>(settings.InmatesCollectionName);
        }

        public List<InmateProgDetails> Get()
        {
            var inmateData = _InmateProgressService.AsQueryable().Where(inmate => true);

            var query = from ip in inmateData
                        join d in _DrugRehabProgrammeService.AsQueryable() on ip.RehabProgID equals d.ProgID
                        join a in _AcadProgrammeService.AsQueryable() on ip.AcadProgID equals a.ProgID
                        join v in _VocationalProgrammeService.AsQueryable() on ip.VocProgID equals v.ProgID
                        join i in _Inmates.AsQueryable() on ip.InmateID equals i.InmateID
                        select new InmateProgDetails()
                        {
                            InmateProgressID = ip.InmateProgressID,
                            RehabProgName = d.ProgName,
                            RehabProgStatus = ip.RehabProgStatus,
                            AcadProgName = a.ProgName,
                            AcadProgStatus = ip.AcadProgStatus,
                            VocalProgName = v.ProgName,
                            VocalProgStatus = ip.VocProgStatus,
                            InmateName = i.InmateName
                        };

            return query.ToList();
        }

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
