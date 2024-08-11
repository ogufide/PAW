using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
   /* [Route("api/[controller]")]
    [ApiController]
    public class MembresiaController(IMembresiaModel iMembresiaModel) : Controller
    {
        public IActionResult ConsultarMembresias()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ConsultarMembresias(Membresia ent)
        {
            var resp = iMembresiaModel.ConsultarMembresias();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Membresia>>((JsonElement)resp.Contenido!);
                return View(datos!.Where(x => x.Id_membresia != HttpContext.Session.GetInt32("CONSECUTIVO")).ToList());
            }

            return View(new List<Membresia>());
        }
    }*/
}

