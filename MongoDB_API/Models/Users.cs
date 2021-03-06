﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB_API.Models
{
    public class Users
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string _Id { get; set; }

        public int UserID { get; set; }
        public string Name { get; set; }
        public int Mobile { get; set; }
        public string Address { get; set; }
        public string Password { get; set; }
    }
}
