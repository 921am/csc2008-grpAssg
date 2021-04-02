using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB_WebApp.Models
{
    public class InmateProgress
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string _Id { get; set; }

        public int InmateProgressID { get; set; }
        public int RehabProgID { get; set; }
        public string RehabProgStatus { get; set; }
        public int AcadProgID { get; set; }
        public string AcadProgStatus { get; set; }
        public int VocProgID { get; set; }
        public string VocProgStatus { get; set; }
        public int InmateID { get; set; }
    }
}
