using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    public class MembresiaController(IMembresiaModel iMembresiaModel) : Controller
    {
        [HttpGet]
        public IActionResult CreateMembresia()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CreateMembresia(Membresia ent)
        {
            var respuesta = iMembresiaModel.CreateMembresia(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("ReadMembresia", "Membresia");
            }
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View(ent);
            }
        }


        [HttpGet]
        public IActionResult ReadMembresia()
        {
            var resp = iMembresiaModel.ReadMembresia();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Membresia>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Membresia>());
        }
    }
}

