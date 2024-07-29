using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    public class GimnasiosController(IGimnasiosModel iGimnasiosModel) : Controller
    {
        [HttpGet]
        public IActionResult AgregarGimnasio()
        {
            return View();
        }

 
        [HttpPost]
        public IActionResult AgregarGimnasio(Gimnasios ent)
        {
            var respuesta = iGimnasiosModel.AgregarGimnasio(ent);
            if (respuesta.Codigo == 1)
                return RedirectToAction("ConsultarGimnasio", "Gimnasios");
            else
                ViewBag.msj = respuesta.Mensaje;
            return View();
        }


        
        [HttpGet]
        public IActionResult ActualizarGimnasio(int Id_gimnasio)
        {
            var resp = iGimnasiosModel.ObtenerGimnasio(Id_gimnasio);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Gimnasios>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new Gimnasios());
        }

        
        [HttpPost]
        public IActionResult ActualizarGimnasio(Gimnasios ent, int Id_gimnasio)
        {
            var respuesta = iGimnasiosModel.ActualizarGimnasio(ent, Id_gimnasio);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ConsultarGimnasio", "Gimnasios");
            else
                ViewBag.msj = respuesta.Mensaje;
            return View();
        }


        [HttpPost]
        public IActionResult EliminarGimnasio(int Id_gimnasio)
        {
            var respuesta = iGimnasiosModel.EliminarGimnasio(Id_gimnasio);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ConsultarGimnasio", "Gimnasios");
            else
            {
                ViewBag.Mensaje = respuesta.Mensaje;
                return View("Error");
            }
        }

     
        [HttpGet]
        public IActionResult ConsultarGimnasio()
        {
            var resp = iGimnasiosModel.ConsultarGimnasio();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Gimnasios>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Gimnasios>());
        }
    }
}
