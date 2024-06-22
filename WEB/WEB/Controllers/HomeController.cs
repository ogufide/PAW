using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IUsuarioModel iUsuarioModel) : Controller
    {
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(Usuario ent)
        {
            var resp = iUsuarioModel.IniciarSesion(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("Login", "Home");

            ViewBag.msj = resp.Mensaje;
            return View();
        }



        [HttpGet]
        public IActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Signup(Usuario ent)
        {
            var resp = iUsuarioModel.IniciarSesion(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("Signup", "Home");

            ViewBag.msj = resp.Mensaje;
            return View();
        }


        [HttpGet]
        public IActionResult Principal()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Principal(Usuario ent)
        {
            var resp = iUsuarioModel.IniciarSesion(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("Principal", "Home");

            ViewBag.msj = resp.Mensaje;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

    }
}

