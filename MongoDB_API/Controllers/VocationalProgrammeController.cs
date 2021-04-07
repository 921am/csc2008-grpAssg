using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MongoDB_API.Models;
using MongoDB_API.Services;

namespace MongoDB_API.Controllers
{
    [Route("api/[controller]")]
    public class VocationalProgrammeController : ControllerBase
    {
        private readonly VocationalProgrammeService _vocationalProgrammeService;
        private readonly CounterService _counterService;

        public VocationalProgrammeController(VocationalProgrammeService vocationalProgrammeService, CounterService counterService)
        {
            _vocationalProgrammeService = vocationalProgrammeService;
            _counterService = counterService;
        }

        [HttpGet]
        public ActionResult<List<VocationalProgramme>> Get() =>
            _vocationalProgrammeService.Get();

        [HttpGet("{id}", Name = "GetVocationalProg")]
        public ActionResult<VocationalProgramme> Get(string id)
        {
            var vocationalProg = _vocationalProgrammeService.Get(int.Parse(id));

            if (vocationalProg == null)
            {
                return NotFound();
            }
            return vocationalProg;
        }

        [HttpPost]
        public ActionResult<VocationalProgramme> Create(VocationalProgramme vocationalProg)
        {
            var counter = _counterService.getNextSequence("vocationalProjID");
            _vocationalProgrammeService.Create(vocationalProg, counter);

            return CreatedAtRoute("GetVocationalProg", new { id = vocationalProg.ProgID.ToString() }, vocationalProg);
        }

        [HttpPut("{id}")]
        public IActionResult Update(string id, VocationalProgramme vocationalProgIn)
        {
            var vocationalProg = _vocationalProgrammeService.Get(int.Parse(id));

            if (vocationalProg == null)
            {
                return NotFound();
            }
            _vocationalProgrammeService.Update(int.Parse(id), vocationalProgIn);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
        {
            var vocationalProg = _vocationalProgrammeService.Get(int.Parse(id));

            if (vocationalProg == null)
            {
                return NotFound();
            }

            _vocationalProgrammeService.Remove(vocationalProg.ProgID);
            return NoContent();
        }
    }
}
