using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB_WebApp.Models;
using MongoDB.Driver;

namespace MongoDB_WebApp.Services
{
    public class UsersService
    {
        private readonly IMongoCollection<Users> _Users;

        public UsersService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _Users = database.GetCollection<Users>(settings.UsersCollectionName);
        }

        public List<Users> Get() =>
            _Users.Find(user => true).ToList();

        public Users Get(int UserID) =>
            _Users.Find(user => user.UserID == UserID).FirstOrDefault();

        public Users Create(Users users)
        {
            _Users.InsertOne(users);
            return users;
        }

        public void Update(int UserID, Users userIn) =>
            _Users.ReplaceOne(user => user.UserID == UserID, userIn);

        public void Remove(Users userIn) =>
            _Users.DeleteOne(user => user.UserID == userIn.UserID);

        public void Remove(int UserID) =>
            _Users.DeleteOne(user => user.UserID == UserID);
    }
}
