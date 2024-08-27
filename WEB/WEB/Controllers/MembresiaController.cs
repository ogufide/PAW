using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using System.Text.Json.Serialization;
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


        [HttpGet]
        public IActionResult DeleteMembresia(int Id_membresia)
        {
            var respuesta = iMembresiaModel.GetMembresiaById(Id_membresia);

            if (respuesta.Codigo == 1)
            {
                var contenido = respuesta.Contenido?.ToString();
                if (!string.IsNullOrEmpty(contenido))
                {
                    var options = new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true,
                        NumberHandling = JsonNumberHandling.AllowReadingFromString | JsonNumberHandling.WriteAsString
                    };
                    var datos = JsonSerializer.Deserialize<Membresia>(contenido, options);
                    return View(datos);
                }
            }

            return View(new Membresia());
        }



        [HttpPost]
        public IActionResult DeleteMembresia(Membresia ent)
        {

            var respuesta = iMembresiaModel.DeleteMembresia(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("ReadMembresia", "Membresia");

            }
            return View();
        }
    }
}

