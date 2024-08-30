using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WEB.Entities;
using WEB.Interface;

namespace WEB.Controllers
{

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]

    public class ProvinciasController(IProvinciasModel iProvinciasModel) : Controller
    {

        [HttpGet]
        public IActionResult ConsultarProvincia()
        {
            var resp = iProvinciasModel.ConsultarProvincia();

            if (resp.Codigo == 1)
            {
                var datos = JsonSerializer.Deserialize<List<Provincias>>((JsonElement)resp.Contenido!);
                return Json(datos);
            }

            return Json(new List<Provincias>());
        }


        [HttpGet]
        public IActionResult ObtenerProvincia(int Id_provincia)
        {
            var resp = iProvinciasModel.ObtenerProvincia(Id_provincia);

            if (resp.Codigo == 1 && resp.Contenido != null)
            {
                try
                {
                    var jsonString = resp.Contenido.ToString();
                    var datos = JsonSerializer.Deserialize<List<Provincias>>(jsonString!);
                    return View(datos);
                }
                catch (JsonException ex)
                {
                    ModelState.AddModelError("", "Error al deserializar los datos de provincias: " + ex.Message);

                }
            }

            return View(new List<Provincias>());
        }
    }

 }

