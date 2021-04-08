using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MongoDB_API.Models;
using MongoDB_API.Services;

namespace MongoDB_API.Controllers
{
    public class InmateProgressController : Controller
    {
        private readonly InmateProgressService _inmateProgressService;
        private readonly CounterService _counterService;

        public InmateProgressController(InmateProgressService inmateProgressService, CounterService counterService)
        {
            _inmateProgressService = inmateProgressService;
            _counterService = counterService;
        }

        [HttpGet("api/[controller]")]
        public ActionResult<List<InmateProgress>> Get() =>
            _inmateProgressService.Get();

        [HttpGet("api/[controller]/{id}", Name = "GetInmateProg")]
        public ActionResult<InmateProgress> Get(string id)
        {
            var inmateProg = _inmateProgressService.Get(int.Parse(id));

            if (inmateProg == null)
            {
                return NotFound();
            }
            return inmateProg;
        }

        [HttpPost("api/[controller]")]
        public ActionResult<InmateProgress> Create(InmateProgress inmateProg)
        {
            var counter = _counterService.getNextSequence("inmateProjID");
            _inmateProgressService.Create(inmateProg, counter);

            return CreatedAtRoute("GetInmateProg", new { id = inmateProg.InmateProgressID.ToString() }, inmateProg);
        }

        [HttpPut("api/[controller]/{id}")]
        public IActionResult Update(string id, InmateProgress inmateProgIn)
        {
            var inmateProg = _inmateProgressService.Get(int.Parse(id));

            if (inmateProg == null)
            {
                return NotFound();
            }
            _inmateProgressService.Update(int.Parse(id), inmateProgIn);

            return NoContent();
        }

        [HttpDelete("api/[controller]/{id}")]
        public IActionResult Delete(string id)
        {
            var inmateProg = _inmateProgressService.Get(int.Parse(id));

            if (inmateProg == null)
            {
                return NotFound();
            }

            _inmateProgressService.Remove(inmateProg.InmateProgressID);
            return NoContent();
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
