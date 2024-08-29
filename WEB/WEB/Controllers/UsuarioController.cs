using Microsoft.AspNetCore.Mvc;
using WEB.Entities;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc.Rendering;
using WEB.Interface;


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

        [FiltroSesiones]
        [HttpGet]
        public IActionResult ReadUsuarios()
        {
            var resp = iUsuarioModel.ReadUsuarios();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Usuario>>((JsonElement)resp.Contenido!);
                return View(datos!.Where(x => x.Identificacion != HttpContext.Session.GetInt32("IDENTIFICACION")).ToList());
            }

            return View(new List<Usuario>());
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult UpdateUsuario(int q)
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

        [FiltroSesiones]
        [HttpPost]
        public IActionResult CambiarEstadoUsuario(Usuario ent)
        {
            var resp = iUsuarioModel.CambiarEstadoUsuario(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("ReadUsuarios", "Usuario");

            ViewBag.msj = resp.Mensaje;
            return View();
        }


        [FiltroSesiones]
        [HttpGet]
        public IActionResult CreateRol()
        {
            return View();
        }

        [FiltroSesiones]
        [HttpPost]
        public IActionResult CreateRol(Rol ent)
        {
            var resp = iRolModel.CreateRol(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("ReadRoles", "Usuario");

            ViewBag.msj = resp.Mensaje;
            return View();
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult ReadRoles()
        {
            var resp = iRolModel.ReadRolesMant();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Rol>>((JsonElement)resp.Contenido!);
                return View(datos!.ToList());
            }

            return View(new List<Rol>());
        }

        [HttpGet]
        public IActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RecuperarAcceso(Usuario ent)
        {
            var resp = iUsuarioModel.RecuperarAcceso(ent.Identificacion.ToString()!);

            if (resp.Codigo == 1)
                return RedirectToAction("Login", "Home");

            ViewBag.msj = resp.Mensaje;
            return View();
        }
    }
}
