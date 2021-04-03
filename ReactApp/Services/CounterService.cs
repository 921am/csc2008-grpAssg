using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ReactApp.Models;
using MongoDB.Driver;

namespace ReactApp.Services
{
    public class CounterService
    {
        private readonly IMongoCollection<Counter> _counter;

        public CounterService(IPrisonDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _counter = database.GetCollection<Counter>(settings.CounterCollectionName);
        }

        public int getNextSequence(string name)
        {
            var count = _counter.Find(counter => counter.name == name).FirstOrDefault();
            count.seq = ++count.seq;

            _counter.ReplaceOne(counter => counter.name == name, count);

            return count.seq;
        }
    }
}
