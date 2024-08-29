using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WEB.Entities;
using WEB.Interface;

namespace WEB.Controllers
{
    public class PlanesController(IPlanesModel iPlanesModel) : Controller
    {
        [HttpGet]
        public IActionResult CreatePlan(Plan ent)
        {
            var respuesta = iPlanesModel.CreatePlan(ent);
            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("CreatePlan", "Planes");
            }
            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }

        [HttpGet]
        public IActionResult ReadPlan()
        {
            var resp = iPlanesModel.ReadPlan();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Plan>>((JsonElement)resp.Contenido!);
                return View(datos);
            }
            return View(new List<Plan>());
        }

        [HttpGet]
        public IActionResult UpdatePlan(Plan ent)
        {
            var respuesta = iPlanesModel.UpdatePlan(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("UpdatePlan", "Planes");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }

        [HttpPost]
        public IActionResult DeletePlan(int Id_plan)
        {
            var respuesta = iPlanesModel.DeletePlan(Id_plan);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("DeletePlan", "Planes");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
        }
    }
}
