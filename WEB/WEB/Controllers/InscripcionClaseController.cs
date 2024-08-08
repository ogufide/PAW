using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using WEB.Entities;
using WEB.Models;

namespace WEB.Controllers
{

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]

    public class InscripcionClaseController(IInscripcionClaseModel iInscripcionClaseModel, IClientesModel iClienteModel, IClasesModel iClasesmodel) : Controller
    {

        [HttpGet]
        public IActionResult AgregarClase()
        {
            // Obtener datos de clientes y clases
            var respClientes = iClienteModel.ConsultarCliente();
            var respClases = iClasesmodel.ReadClases();

            List<Clientes> clientes = new List<Clientes>();
            List<Clase> clases = new List<Clase>();

            if (respClientes.Codigo == 1)
            {
                clientes = JsonSerializer.Deserialize<List<Clientes>>((JsonElement)respClientes.Contenido!);
            }

            if (respClases.Codigo == 1)
            {
                clases = JsonSerializer.Deserialize<List<Clase>>((JsonElement)respClases.Contenido!);
            }

            // Preparar el modelo con los dropdowns
            var model = new InscripcionClases
            {
                NombreCliente = clientes.Select(c => new SelectListItem
                {
                    Value = c.Id_cliente.ToString(),
                    Text = c.Nombre
                }).ToList(),
                NombreClase = clases.Select(c => new SelectListItem
                {
                    Value = c.Id_clase.ToString(),
                    Text = c.Nombre
                }).ToList()
            };

            return View(model);
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
