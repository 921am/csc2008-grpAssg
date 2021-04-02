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
    public class AcadProgrammeController : ControllerBase
    {
        private readonly AcadProgrammeService _acadProgrammeService;

        public AcadProgrammeController(AcadProgrammeService acadProgrammeService)
        {
            _acadProgrammeService = acadProgrammeService;
        }

        [HttpGet]
        public ActionResult<List<AcadProgramme>> Get() =>
            _acadProgrammeService.Get();

        [HttpGet("{id}", Name = "GetAcadProg")]
        public ActionResult<AcadProgramme> Get(string id)
        {
            var acadProg = _acadProgrammeService.Get(int.Parse(id));

            if (acadProg == null)
            {
                return NotFound();
            }
            return acadProg;
        }

        [HttpPost]
        public ActionResult<AcadProgramme> Create(AcadProgramme acadProg)
        {
            _acadProgrammeService.Create(acadProg);

            return CreatedAtRoute("GetAcadProg", new { id = acadProg.ProgID.ToString() }, acadProg);
        }

        [HttpPut("{id}")]
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

        [HttpDelete("{id}")]
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
    }
}
