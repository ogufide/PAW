using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    public class EjerciciosController(IEjerciciosModel iEjerciciosModel) : Controller
    {
        [HttpGet]
        public IActionResult CreateEjercicio(Ejercicio ent)
        {
            var respuesta = iEjerciciosModel.CreateEjercicio(ent);
            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("CreateEjercicio", "Ejercicios");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }

        }

        [HttpGet]
        public IActionResult ReadEjercicios()
        {
            var resp = iEjerciciosModel.ReadEjercicios();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Clase>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Clase>());
        }

        [HttpGet]
        public IActionResult UpdateEjercicio(Ejercicio ent)
        {
            var respuesta = iEjerciciosModel.UpdateEjercicio(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("UpdateEjercicio", "Ejercicios");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }

        [HttpPost]
        public IActionResult DeleteEjercicio(int Id_ejercicio)
        {
            var respuesta = iEjerciciosModel.DeleteEjercicio(Id_ejercicio);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("DeleteEjercicio", "Ejercicios");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }
    }
}