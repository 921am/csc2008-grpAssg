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
    public class VocationalProgrammeController : ControllerBase
    {
        private readonly VocationalProgrammeService _vocationalProgrammeService;

        public VocationalProgrammeController(VocationalProgrammeService vocationalProgrammeService)
        {
            _vocationalProgrammeService = vocationalProgrammeService;
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
            _vocationalProgrammeService.Create(vocationalProg);

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
