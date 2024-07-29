using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{
    public class EmpleadosController(IEmpleadosModel iEmpleadosModel) : Controller
    {
        public IActionResult AgregarEmpleado(Empleados ent)
        {
            var respuesta = iEmpleadosModel.AgregarEmpleado(ent);
            if (respuesta.Codigo == 1)
                return RedirectToAction("Empleado", "Empleados");
            else
                ViewBag.msj = respuesta.Mensaje;
            return View();
        }

        
        [HttpGet]
        public IActionResult ActualizarEmpleado(int Id_empleado)
        {
            var resp = iEmpleadosModel.ObtenerEmpleado(Id_empleado);

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<Empleados>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new Empleados());
        }

        
        [HttpPost]
        public IActionResult ActualizarEmpleado(Empleados ent, int Id_empleado)
        {
            var respuesta = iEmpleadosModel.ActualizarEmpleado(ent, Id_empleado);

            if (respuesta.Codigo == 1)
                return RedirectToAction("ActualizarEmpleado", "Empleados");
            else
                ViewBag.msj = respuesta.Mensaje;
            return View();
        }



        [HttpPost]
        public IActionResult EliminarEmpleado(int id_empleado)
        {

            var respuesta = iEmpleadosModel.EliminarEmpleado(id_empleado);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("Empleado", "Empleados");
            }
            else
            {
                ViewBag.Mensaje = respuesta.Mensaje;
                return View("Error");
            }
        }


        [HttpGet]
        public IActionResult ConsultarEmpleado()
        {
            var resp = iEmpleadosModel.ConsultarEmpleado();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Empleados>>((JsonElement)resp.Contenido!);
                return View(datos);
            }

            return View(new List<Empleados>());
        }
    }
}
