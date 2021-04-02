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
    public class DrugRehabProgrammeController : ControllerBase
    {
        private readonly DrugRehabProgrammeService _drugRehabProgrammeService;
        private readonly CounterService _counterService;

        public DrugRehabProgrammeController(DrugRehabProgrammeService drugRehabProgrammeService, CounterService counterService)
        {
            _drugRehabProgrammeService = drugRehabProgrammeService;
            _counterService = counterService;
        }

        [HttpGet]
        public ActionResult<List<DrugRehabProgramme>> Get() =>
            _drugRehabProgrammeService.Get();

        [HttpGet("{id}", Name = "GetDrugRehabProg")]
        public ActionResult<DrugRehabProgramme> Get(string id)
        {
            var drugRehabProg = _drugRehabProgrammeService.Get(int.Parse(id));

            if (drugRehabProg == null)
            {
                return NotFound();
            }
            return drugRehabProg;
        }

        [HttpPost]
        public ActionResult<DrugRehabProgramme> Create(DrugRehabProgramme drugRehabProg)
        {
            var counter = _counterService.getNextSequence("drugRehabProjID");
            _drugRehabProgrammeService.Create(drugRehabProg, counter);

            return CreatedAtRoute("GetDrugRehabProg", new { id = drugRehabProg.ProgID.ToString() }, drugRehabProg);
        }

        [HttpPut("{id}")]
        public IActionResult Update(string id, DrugRehabProgramme drugRehabProgIn)
        {
            var drugRehabProg = _drugRehabProgrammeService.Get(int.Parse(id));

            if (drugRehabProg == null)
            {
                return NotFound();
            }
            _drugRehabProgrammeService.Update(int.Parse(id), drugRehabProgIn);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
        {
            var drugRehabProg = _drugRehabProgrammeService.Get(int.Parse(id));

            if (drugRehabProg == null)
            {
                return NotFound();
            }

            _drugRehabProgrammeService.Remove(drugRehabProg.ProgID);
            return NoContent();
        }
    }
}
