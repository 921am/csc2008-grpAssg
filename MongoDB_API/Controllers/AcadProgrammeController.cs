using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MongoDB_API.Models;
using MongoDB_API.Services;

namespace MongoDB_API.Controllers
{
    public class AcadProgrammeController : Controller
    {
        private readonly AcadProgrammeService _acadProgrammeService;
        private readonly CounterService _counterService;

        public AcadProgrammeController(AcadProgrammeService acadProgrammeService, CounterService counterService)
        {
            _acadProgrammeService = acadProgrammeService;
            _counterService = counterService;
        }

        [HttpGet("api/[controller]")]
        public ActionResult<List<AcadProgramme>> Get() =>
            _acadProgrammeService.Get();

        [HttpGet("api/[controller]/{id}", Name = "GetAcadProg")]
        public ActionResult<AcadProgramme> Get(string id)
        {
            var acadProg = _acadProgrammeService.Get(int.Parse(id));

            if (acadProg == null)
            {
                return NotFound();
            }
            return acadProg;
        }

        [HttpPost("api/[controller]")]
        public ActionResult<AcadProgramme> Create(AcadProgramme acadProg)
        {
            var counter = _counterService.getNextSequence("acadProjID");
            _acadProgrammeService.Create(acadProg, counter);

            return CreatedAtRoute("GetAcadProg", new { id = acadProg.ProgID.ToString() }, acadProg);
        }

        [HttpPut("api/[controller]/{id}")]
        public IActionResult Update(string id, AcadProgramme acadProgIn)
        {
            var acadProg = _acadProgrammeService.Get(int.Parse(id));

            if (acadProg == null)
            {
                return NotFound();
            }
            _acadProgrammeService.Update(int.Parse(id), acadProgIn);

            return NoContent();
        }

        [HttpDelete("api/[controller]/{id}")]
        public IActionResult Delete(string id)
        {
            var acadProg = _acadProgrammeService.Get(int.Parse(id));

            if (acadProg == null)
            {
                return NotFound();
            }

            _acadProgrammeService.Remove(acadProg.ProgID);
            return NoContent();
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
