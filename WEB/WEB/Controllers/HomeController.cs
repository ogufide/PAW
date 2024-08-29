using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text.Json;
using WEB.Entities;
using WEB.Interface;

namespace WEB.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class HomeController(IUsuarioModel iUsuarioModel, IComunModel iComunModel, IProductoModel iProductoModel, IGimnasiosModel iGimnasiosModel) : Controller
    {


        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(Usuario ent)
        {
            ent.Contrasenna = iComunModel.Encrypt(ent.Contrasenna!);
            var resp = iUsuarioModel.IniciarSesion(ent);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Usuario>((JsonElement)resp.Contenido!);

                if (datos!.EsTemporal)
                {
                    if (datos!.VigenciaTemporal <= DateTime.Now)
                    {
                        ViewBag.msj = "Su contraseña temporal ha caducado.";
                        return View();
                    }
                }

                HttpContext.Session.SetString("TOKEN", datos!.Token!);
                HttpContext.Session.SetString("NOMBRE", datos!.Nombre!);
                HttpContext.Session.SetString("ROL", datos!.Id_rol.ToString());
                HttpContext.Session.SetString("NROL", datos!.Descripcion!);
                HttpContext.Session.SetInt32("IDENTIFICACION", datos!.Identificacion);
                return RedirectToAction("Principal", "Home");
            }

            ViewBag.msj = resp.Mensaje;
            return View();
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult Salir()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login", "Home");
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Class()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Services()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Privacy()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Admin()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Principal()
        {
            var resp = iProductoModel.ReadProductos();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Producto>());
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult CreateProducto()
        {
            return View();
        }

        [FiltroSesiones]
        [HttpPost]
        public IActionResult CreateProducto(Producto ent)
        {
            var resp = iProductoModel.CreateProducto(ent);

            if (resp.Codigo == 1)
                return RedirectToAction("Principal", "Home");

            ViewBag.msj = resp.Mensaje;
            return View();
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult Home()
        {
            var resp = iProductoModel.ReadProductos();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Producto>());
        }

        [HttpGet]
        public IActionResult Gimnasio(int Id_gimnasio)
        {
            var resp = iGimnasiosModel.ObtenerGimnasio(Id_gimnasio);

            if (resp.Codigo == 1)
            {
                var gimnasio = JsonSerializer.Deserialize<Gimnasios>((JsonElement)resp.Contenido!);

                if (gimnasio != null)
                {
                    HttpContext.Session.SetString("NOMBRE", gimnasio.Nombre ?? "Nombre no disponible");
                    HttpContext.Session.SetString("TELEFONO", gimnasio.Telefono ?? "Teléfono no disponible");
                    HttpContext.Session.SetString("DIRECCION", gimnasio.Direccion ?? "Dirección no disponible");
                    HttpContext.Session.SetString("PROVINCIA", gimnasio.Provincia ?? "Provincia no disponible");

                    return View(gimnasio);
                }
            }

            return View("Error");
        }

        [FiltroSesiones]
        [HttpGet]
        public IActionResult InventarioProductos()
        {
            var resp = iProductoModel.InventarioProductos();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Producto>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Producto>());
        }








    }
}

