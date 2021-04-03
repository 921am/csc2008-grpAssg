using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ReactApp.Models;
using MongoDB.Driver;

namespace ReactApp.Services
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

        public Users Create(Users users, int counter)
        {
            users.UserID = counter;
            _Users.InsertOne(users);
            return users;
        }

        public void Update(int UserID, Users userIn)
        {
            var targetUser = Get(UserID);

            if (userIn.Name != null)
                targetUser.Name = userIn.Name;
            if (userIn.Mobile != null)
                targetUser.Mobile = userIn.Mobile;
            if (userIn.Address != null)
                targetUser.Address = userIn.Address;
            if (userIn.Password != null)
                targetUser.Password = userIn.Password;

            _Users.ReplaceOne(user => user.UserID == UserID, targetUser);
        }

        public void Remove(int UserID) =>
            _Users.DeleteOne(user => user.UserID == UserID);
    }
}
