using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ReactApp.Models;
using ReactApp.Services;

namespace ReactApp.Controllers
{
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly UsersService _userService;
        private readonly CounterService _counterService;

        public UsersController(UsersService usersService, CounterService counterService)
        {
            _userService = usersService;
            _counterService = counterService;
        }

        [HttpGet]
        public ActionResult<List<Users>> Get() =>
            _userService.Get();

        [HttpGet("{id}", Name = "GetUser")]
        public ActionResult<Users> Get(string id)
        {
            var user = _userService.Get(int.Parse(id));

            if (user == null)
            {
                return NotFound();
            }
            return user;
        }

        [HttpPost]
        public ActionResult<Users> Create(Users user)
        {
            var counter = _counterService.getNextSequence("userID");
            _userService.Create(user, counter);

            return CreatedAtRoute("GetUser", new { id = user.UserID.ToString() }, user);
        }

        [HttpPut("{id}")]
        public IActionResult Update(string id, Users userIn)
        {
            var user = _userService.Get(int.Parse(id));

            if (user == null)
            {
                return NotFound();
            }
            _userService.Update(int.Parse(id), userIn);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
        {
            var user = _userService.Get(int.Parse(id));

            if (user == null)
            {
                return NotFound();
            }

            _userService.Remove(user.UserID);
            return NoContent();
        }
    }
}
