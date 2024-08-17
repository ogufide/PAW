using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    public class ClasesController(IClasesModel iClasesModel) : Controller
    {
        [HttpGet]
        public IActionResult CreateClase(Clase ent)
        { 
            var respuesta = iClasesModel.CreateClase(ent);
            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("AgregarGimnasio", "Gimnasios");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }

        }

        [HttpGet]
        public IActionResult ReadClases()
        {
            var resp = iClasesModel.ReadClases();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Clase>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Clase>());
        }

        [HttpGet]
        public IActionResult UpdateClase(Clase ent)
        {
            var respuesta = iClasesModel.UpdateClase(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("UpdateClase", "Clases");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }

        [HttpPost]
        public IActionResult DeleteClase(int Id_clase)
        {
            var respuesta = iClasesModel.DeleteClase(Id_clase);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("ReadClases", "Clases");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }
    }
}
