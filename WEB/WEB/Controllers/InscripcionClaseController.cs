using System.Data;
using System.Text.Json;
using System.Text.Json.Serialization;
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
            if (ModelState.IsValid)
            {
                
                var respuesta = iInscripcionClaseModel.AgregarClase(ent);
                if (respuesta.Codigo == 1)
                {
                    return RedirectToAction("AgregarClase", "InscripcionClase");
                }
                else
                {
                    ViewBag.msj = respuesta.Mensaje;
                }
            }

            
            var respClientes = iClienteModel.ConsultarCliente();
            var respClases = iClasesmodel.ReadClases();

            ent.NombreCliente = respClientes.Codigo == 1
                ? JsonSerializer.Deserialize<List<Clientes>>((JsonElement)respClientes.Contenido!).Select(c => new SelectListItem
                {
                    Value = c.Id_cliente.ToString(),
                    Text = c.Nombre
                }).ToList()
                : new List<SelectListItem>();

            ent.NombreClase = respClases.Codigo == 1
                ? JsonSerializer.Deserialize<List<Clase>>((JsonElement)respClases.Contenido!).Select(c => new SelectListItem
                {
                    Value = c.Id_clase.ToString(),
                    Text = c.Nombre
                }).ToList()
                : new List<SelectListItem>();

            return View(ent);
        }


        [HttpGet]
        public ActionResult ReadInscripcion()
        {
            var respuesta = iInscripcionClaseModel.ReadInscripcion();

            if (respuesta.Codigo == 1)
            {
                var contenido = respuesta.Contenido?.ToString();
                if (!string.IsNullOrEmpty(contenido))
                {
                    var options = new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true,
                        NumberHandling = JsonNumberHandling.AllowReadingFromString | JsonNumberHandling.WriteAsString
                    };
                    var datos = JsonSerializer.Deserialize<List<InscripcionClases>>(contenido, options);
                    return View(datos);
                }
            }

            return View(new List<InscripcionClases>());
        }


        [HttpGet]
        public IActionResult UpdateInscripcion(int q)
        {
            // Inicializa el modelo con listas vacías
            var model = new InscripcionClases
            {
                NombreCliente = new List<SelectListItem>(),
                NombreClase = new List<SelectListItem>()
            };

            // Obtiene la inscripción por ID
            var resp = iInscripcionClaseModel.GetInscripcionById(q);

            // Obtiene las listas de clientes y clases
            var respClientes = iClienteModel.ConsultarCliente();
            var respClases = iClasesmodel.ReadClases();

            // Deserializa las listas de clientes y clases
            List<Clientes> clientes = JsonSerializer.Deserialize<List<Clientes>>((JsonElement)respClientes.Contenido!) ?? new List<Clientes>();
            List<Clase> clases = JsonSerializer.Deserialize<List<Clase>>((JsonElement)respClases.Contenido!) ?? new List<Clase>();

            // Llena las listas desplegables en el modelo
            model.NombreCliente = clientes.Select(c => new SelectListItem
            {
                Value = c.Id_cliente.ToString(),
                Text = c.Nombre
            }).ToList();

            model.NombreClase = clases.Select(c => new SelectListItem
            {
                Value = c.Id_clase.ToString(),
                Text = c.Nombre
            }).ToList();

            // Verifica si la respuesta es exitosa
            if (resp.Codigo == 1)
            {
                // Deserializa los datos de la inscripción y llena el modelo
                var datos = JsonSerializer.Deserialize<InscripcionClases>((JsonElement)resp.Contenido!);
                if (datos != null)
                {
                    datos.NombreCliente = model.NombreCliente;
                    datos.NombreClase = model.NombreClase;
                    model = datos;
                }
            }

            // Retorna la vista con el modelo (ya sea con datos o vacío)
            return View(model);
        }



        [HttpPost]
        public IActionResult UpdateInscripcion(InscripcionClases ent)
        {
            var respuesta = iInscripcionClaseModel.UpdateInscripcion(ent);

            if (respuesta.Codigo == 1)
            {
                return RedirectToAction("UpdateInscripcion", "InscripcionClase");
            }

            else
            {
                ViewBag.msj = respuesta.Mensaje;
                return View();
            }

        }



    }
}
