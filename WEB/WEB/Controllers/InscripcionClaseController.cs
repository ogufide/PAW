using Microsoft.AspNetCore.Mvc;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]

    public class InscripcionClaseController(IInscripcionClaseModel iInscripcionClaseModel) : Controller
    {


        [HttpGet]
        public IActionResult AgregarClase()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AgregarClase(InscripcionClases ent)
        {
            var respuesta = iInscripcionClaseModel.AgregarClase(ent);
            if (respuesta.Codigo == 1)
                return RedirectToAction("AgregarClase", "InscripcionClase");
            else
                ViewBag.msj = respuesta.Mensaje;
            return View();
        }
    }
}
