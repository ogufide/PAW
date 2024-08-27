using System.Text.Json.Serialization;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using WEB.Entities;
using WEB.Models;


namespace WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]

    public class RutinaController(IRutinaModel iRutinaModel, IPlanesModel iPlanesModel) : Controller
    {

        [HttpGet]
        public IActionResult CreateRutina()
        {
            var respPlanes = iPlanesModel.ReadPlan();

            List<Plan> planes = new List<Plan>();
            

            if (respPlanes.Codigo == 1)
            {
                planes = JsonSerializer.Deserialize<List<Plan>>((JsonElement)respPlanes.Contenido!);
            }
            var model = new Rutina
            {
                SelectedNombrePlan = planes.Select(c => new SelectListItem
                {
                    Value = c.Id_plan.ToString(),
                    Text = c.Nombre
                }).ToList()
            };

            return View(model);
        }

        [HttpPost]
        public IActionResult CreateRutina(Rutina ent)
        {
            if (ModelState.IsValid)
            {

                var respuesta = iRutinaModel.CreateRutina(ent);
                if (respuesta.Codigo == 1)
                {
                    return RedirectToAction("ReadRutina", "Rutina");
                }
                else
                {
                    ViewBag.msj = respuesta.Mensaje;
                }
            }

            return View(ent);
        }


        [HttpGet]
        public ActionResult ReadRutina()
        {
            var respuesta = iRutinaModel.ReadRutina();

            if (respuesta.Codigo == 1)
            {
                var contenido = respuesta.Contenido?.ToString();
                if (!string.IsNullOrEmpty(contenido))
                {
                   
                    var datos = JsonSerializer.Deserialize<List<Rutina>>(contenido);
                    return View(datos);
                }
            }

            return View(new List<Rutina>());
        }


        [HttpGet]
        public IActionResult UpdateRutina(int Id_rutina)
        {

            var model = new Rutina
            {
                SelectedNombrePlan = new List<SelectListItem>(),
                
            };


            var resp = iRutinaModel.GetRutinaById(Id_rutina);
            var respPlanes = iPlanesModel.ReadPlan();
            

            List<Plan> planes = JsonSerializer.Deserialize<List<Plan>>((JsonElement)respPlanes.Contenido!) ?? new List<Plan>();


            model.SelectedNombrePlan = planes.Select(c => new SelectListItem
            {
                Value = c.Id_plan.ToString(),
                Text = c.Nombre
            }).ToList();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Rutina>((JsonElement)resp.Contenido!);
                if (datos != null)
                {
                    datos.SelectedNombrePlan = model.SelectedNombrePlan;
                    model = datos;
                }
            }

            return View(model);
        }



        [HttpPost]
        public IActionResult UpdateRutina(Rutina ent)
        {
            var respuesta = iRutinaModel.UpdateRutina(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("ReadRutina", "Rutina");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }

        }

        [HttpGet]
        public IActionResult DeleteRutina(int Id_rutina)
        {
            var respuesta = iRutinaModel.GetRutinaById(Id_rutina);

            if (respuesta.Codigo == 1)
            {
                var contenido = respuesta.Contenido?.ToString();
                if (!string.IsNullOrEmpty(contenido))
                {
                  
                    var datos = JsonSerializer.Deserialize<Rutina>(contenido);
                    return View(datos);
                }
            }

            return View(new Rutina());
        }



        [HttpPost]
        public IActionResult DeleteRutina(Rutina ent)
        {

            var respuesta = iRutinaModel.DeleteRutina(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("ReadRutina", "Rutina");

            }
            return View();
        }



    }
}
