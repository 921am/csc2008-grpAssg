using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB_API.Models
{
    public class InmateProgDetails
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public int InmateProgressID { get; set; }

        public string RehabProgName { get; set; }
        public string RehabProgStatus { get; set; }
        public string AcadProgName { get; set; }
        public string AcadProgStatus { get; set; }
        public string VocalProgName { get; set; }
        public string VocalProgStatus { get; set; }
        public string InmateName { get; set; }
    }
}
