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
    public class InmatesController : ControllerBase
    {
        private readonly InmateService _inmateService;
        private readonly CounterService _counterService;

        public InmatesController(InmateService inmateService, CounterService counterService)
        {
            _inmateService = inmateService;
            _counterService = counterService;
        }

        [HttpGet]
        public ActionResult<List<Inmates>> Get() =>
            _inmateService.Get();

        [HttpGet("{id}", Name = "GetInmate")]
        public ActionResult<Inmates> Get(string id)
        {
            var inmate = _inmateService.Get(int.Parse(id));

            if (inmate == null)
            {
                return NotFound();
            }
            return inmate;
        }

        [HttpPost]
        public ActionResult<Inmates> Create(Inmates inmates)
        {
            var counter = _counterService.getNextSequence("inmateID");
            _inmateService.Create(inmates, counter);

            return CreatedAtRoute("GetInmate", new { id = inmates.InmateID.ToString() }, inmates);
        }

        [HttpPut("{id}")]
        public IActionResult Update(string id, Inmates inmatesIn)
        {
            var inmates = _inmateService.Get(int.Parse(id));

            if (inmates == null)
            {
                return NotFound();
            }
            _inmateService.Update(int.Parse(id), inmatesIn);

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
        {
            var inmate = _inmateService.Get(int.Parse(id));

            if (inmate == null)
            {
                return NotFound();
            }

            _inmateService.Remove(inmate.InmateID);
            return NoContent();
        }
    }
}
