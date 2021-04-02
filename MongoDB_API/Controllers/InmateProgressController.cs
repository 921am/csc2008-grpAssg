using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MongoDB_WebApp.Models;
using MongoDB_WebApp.Services;

namespace MongoDB_WebApp.Controllers
{
    [Route("api/[controller]")]
    public class InmateProgressController : ControllerBase
    {
        private readonly InmateProgressService _inmateProgressService;
        private readonly CounterService _counterService;

        public InmateProgressController(InmateProgressService inmateProgressService, CounterService counterService)
        {
            _inmateProgressService = inmateProgressService;
            _counterService = counterService;
        }

        [HttpGet]
        public ActionResult<List<InmateProgress>> Get() =>
            _inmateProgressService.Get();

        [HttpGet("{id}", Name = "GetInmateProg")]
        public ActionResult<InmateProgress> Get(string id)
        {
            var inmateProg = _inmateProgressService.Get(int.Parse(id));

            if (inmateProg == null)
            {
                return NotFound();
            }
            return inmateProg;
        }

        [HttpPost]
        public ActionResult<InmateProgress> Create(InmateProgress inmateProg)
        {
            var counter = _counterService.getNextSequence("inmateProjID");
            _inmateProgressService.Create(inmateProg, counter);

            return CreatedAtRoute("GetInmateProg", new { id = inmateProg.InmateProgressID.ToString() }, inmateProg);
        }

        [HttpPut("{id}")]
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

        [HttpDelete("{id}")]
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
    }
}
