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

        public List<InmatesDetails> Get()
        {
            var inmateData = _inmates.AsQueryable().Where(inmate => true);

            CultureInfo culture = CultureInfo.InvariantCulture;
            var query = (from i in inmateData
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
                             SentenceDuration = null
                         }).AsEnumerable().Select(x => new InmatesDetails
                         {
                             InmateID = x.InmateID,
                             InmateName = x.InmateName,
                             Gender = x.Gender,
                             DateEntered = x.DateEntered,
                             DateReleased = x.DateReleased,
                             DrugOffender = x.DrugOffender,
                             Enrolled = x.Enrolled,
                             SentenceDuration = sentenceDuration(x.DateReleased, x.DateEntered).ToString()
                         });
            
            var query2 = (from i in inmateData
                          select new InmatesDetails()
                          {
                              InmateID = i.InmateID,
                              InmateName = i.InmateName,
                              Gender = i.Gender,
                              DateEntered = i.DateEntered,
                              DateReleased = i.DateReleased,
                              DrugOffender = i.DrugOffender,
                              Enrolled = i.InmateID == 0,
                              SentenceDuration = null
                          }).AsEnumerable().Select(x => new InmatesDetails
                          {
                              InmateID = x.InmateID,
                              InmateName = x.InmateName,
                              Gender = x.Gender,
                              DateEntered = x.DateEntered,
                              DateReleased = x.DateReleased,
                              DrugOffender = x.DrugOffender,
                              Enrolled = x.Enrolled,
                              SentenceDuration = sentenceDuration(x.DateReleased, x.DateEntered).ToString()
                          });

            IEnumerable<InmatesDetails> queryUnion = query.Union(query2, new DefaultQueryComparer());
            List<InmatesDetails> sortedQuery = queryUnion.OrderBy(o => o.InmateID).ToList();

            return sortedQuery;
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

        private int sentenceDuration (string DateReleased, string DateEntered)
        {
            DateTime releasedDateTime = Convert.ToDateTime(DateReleased);
            DateTime enteredDateTime = Convert.ToDateTime(DateEntered);
            var dateDiffInDays = (releasedDateTime - enteredDateTime).Days;

            return dateDiffInDays;
        }

        private class DefaultQueryComparer : IEqualityComparer<InmatesDetails>
        {
            public bool Equals(InmatesDetails x, InmatesDetails y)
            {
                return x.InmateID == y.InmateID;
            }
            public int GetHashCode(InmatesDetails obj)
            {
                return obj.InmateID.GetHashCode();
            }
        }
    }
}
