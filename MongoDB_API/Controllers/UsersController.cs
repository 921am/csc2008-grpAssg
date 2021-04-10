using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MongoDB_API.Models;
using MongoDB_API.Services;
using Microsoft.Extensions.Logging;
using System.Diagnostics;

namespace MongoDB_API.Controllers
{
    public class UsersController : Controller
    {
        private readonly UsersService _userService;
        private readonly CounterService _counterService;


        public UsersController(UsersService usersService, CounterService counterService)
        {
            _userService = usersService;
            _counterService = counterService;
        }

        [HttpGet("api/[controller]")]
        public ActionResult<List<Users>> Get() =>
            _userService.Get();

        [HttpGet("api/[controller]/{id}", Name = "GetUser")]
        public ActionResult<Users> Get(string id)
        {
            var user = _userService.Get(int.Parse(id));

            if (user == null)
            {
                return NotFound();
            }
            return user;
        }

        [HttpPost("api/[controller]")]
        public ActionResult<Users> Create(Users user)
        {
            var counter = _counterService.getNextSequence("userID");
            _userService.Create(user, counter);

            return CreatedAtRoute("GetUser", new { id = user.UserID.ToString() }, user);
        }

        [HttpPut("api/[controller]/{id}")]
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

        [HttpDelete("api/[controller]/{id}")]
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

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

    }
}
