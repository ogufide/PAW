using Microsoft.AspNetCore.Mvc;
using WEB.Entities;
using WEB.Models;
using System.Text.Json;


namespace WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class UsuarioController(IUsuarioModel iUsuarioModel, IComunModel iComunModel) : Controller
    {

        [HttpGet]
        public IActionResult CreateUsuario()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CreateUsuario(Usuario ent)
        {
            ent.Contrasenna = iComunModel.Encrypt(ent.Contrasenna!);
            var resp = iUsuarioModel.CreateUsuario(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("Login", "Home");

            ViewBag.msj = resp.Mensaje;
            return View();
        }

        [HttpGet]
        public IActionResult ReadUsuarios()
        {
            var resp = iUsuarioModel.ReadUsuarios();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Usuario>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Usuario>());
        }
    }
}
