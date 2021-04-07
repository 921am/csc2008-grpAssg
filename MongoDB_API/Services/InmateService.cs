using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_API.Models;
using MongoDB.Driver;
using System.Globalization;

namespace MongoDB_API.Services
{
    public class InmateService
    {
        private readonly IMongoCollection<Inmates> _inmates;
        private readonly IMongoCollection<InmateProgress> _InmateProgressService;

        public InmateService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _inmates = database.GetCollection<Inmates>(settings.InmatesCollectionName);
            _InmateProgressService = database.GetCollection<InmateProgress>(settings.InmateProgressCollectionName);
        }

        public List<Inmates> Get()
        {
            var inmateData = _inmates.AsQueryable().Where(inmate => true);

            CultureInfo culture = CultureInfo.InvariantCulture;
            var query = from i in inmateData
                        join ip in _InmateProgressService.AsQueryable()
                        on i.InmateID equals ip.InmateID 
                        select new InmatesDetails()
                        {
                            InmateID = i.InmateID,
                            InmateName = i.InmateName,
                            Gender = i.Gender,
                            DateEntered = i.DateEntered,
                            DateReleased = i.DateReleased,
                            DrugOffender = i.DrugOffender,
                            Enrolled = i.InmateID == ip.InmateID,
                            //SentenceDuration = i.DateReleased
                            //SentenceDuration = (i.DateReleased - i.DateEntered).TotalDays.ToString()
                            //SentenceDuration =  (i.DateReleased, i.DateEntered) "2017-12-17T00:00:00.000Z"
                        };
            //var enrolled = query.AsQueryable().Where(query => true);
            //var query2 = from q in query
                         //where q.Enrolled == true
                         //select q;


            
            return inmateData.ToList();
        }

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
