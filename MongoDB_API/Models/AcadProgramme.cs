using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB_API.Models
{
    public class AcadProgramme
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string _Id { get; set; }

        public int ProgID { get; set; }
        public string ProgName { get; set; }
        public string ProgDescrip { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
    }
}
