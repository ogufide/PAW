using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace WEB.Controllers
{

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]

    public class ClientesController(IClientesModel iClientesModel) : Controller
    {


        [HttpGet]
        public IActionResult AgregarCliente()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AgregarCliente(Clientes ent)
        {
            var respuesta = iClientesModel.AgregarCliente(ent);
            if (respuesta.Codigo == 1) 
            {
                return RedirectToAction("AgregarCliente", "ClientesController");
            }

            else {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }
                
        }


   


        [HttpGet]
        public IActionResult ActualizarUsuario(int Id_cliente)
        {

            var resp = iClientesModel.ObtenerCliente(Id_cliente);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Clientes>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new Clientes());
        }

        
        [HttpPost]
        public IActionResult ActualizarCliente(Clientes ent)
        {
            var respuesta = iClientesModel.ActualizarCliente(ent);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ActualizarCliente", "Clientes");
           
                ViewBag.msj = respuesta.Mensaje;
                return View();
        }

        [HttpGet]
        public IActionResult EliminarCliente()
        {
            return View();
        }

        
        [HttpPost]
       public IActionResult EliminarCliente(int Id_cliente)
        {
          
            var respuesta = iClientesModel.EliminarCliente(Id_cliente);
            
            if (respuesta.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Clientes>((JsonElement)respuesta.Contenido!);
                return View(datos);

            }
            return View();
        }



        [HttpGet]
        public IActionResult ConsultarCliente()
        {
            var resp = iClientesModel.ConsultarCliente();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Clientes>>((JsonElement)resp.Contenido!);
                return View(datos!.Where(x => x.Id_cliente != HttpContext.Session.GetInt32("CONSECUTIVO")).ToList());
            }

            return View(new List<Clientes>());
        }


    }
}
