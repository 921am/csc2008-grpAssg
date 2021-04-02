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
    public class InmatesController : ControllerBase
    {
        private readonly InmateService _inmateService;

        public InmatesController(InmateService inmateService)
        {
            _inmateService = inmateService;
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
            _inmateService.Create(inmates);

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
