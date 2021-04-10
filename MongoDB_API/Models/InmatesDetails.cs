using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB_API.Models
{
    public class InmatesDetails
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public int InmateID { get; set; }
        public string InmateName { get; set; }
        public string Gender { get; set; }
        public string DateEntered { get; set; }
        public string DateReleased { get; set; }
        public Boolean DrugOffender { get; set; }
        public Boolean Enrolled { get; set; }
        public string SentenceDuration { get; set; }
    }
}
