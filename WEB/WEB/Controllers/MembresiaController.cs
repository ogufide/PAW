using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MembresiaController(IMembresiaModel iMembresiaModel) : ControllerBase
    {

        [HttpGet]
        public IActionResult ConsultarMembresias()
        {
            var resp = iMembresiaModel.ConsultarMembresias();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Membresia>>((JsonElement)resp.Contenido!);
                return View(datos!.Where(x => x.Consecutivo != HttpContext.Session.GetInt32("CONSECUTIVO")).ToList());
            }

            return View(new List<Membresia>());
        }
    }
}

