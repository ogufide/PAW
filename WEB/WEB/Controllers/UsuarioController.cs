using Microsoft.AspNetCore.Mvc;
using WEB.Entities;
using WEB.Models;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc.Rendering;


namespace WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class UsuarioController(IUsuarioModel iUsuarioModel, IComunModel iComunModel, IRolModel iRolModel) : Controller
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
                return View(datos!.Where(x => x.Identificacion != HttpContext.Session.GetString("IDENTIFICACION")).ToList());
            }

            return View(new List<Usuario>());
        }

        [HttpGet]
        public IActionResult ActualizarUsuario(int q)
        {
            var roles = iRolModel.ReadRoles();
            ViewBag.Roles = JsonSerializer.Deserialize<List<SelectListItem>>((JsonElement)roles.Contenido!);

            var resp = iUsuarioModel.GetUsuarioById(q);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new Usuario());
        }
    }
}
