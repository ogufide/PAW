using Microsoft.AspNetCore.Mvc;
using PracticaWeb.Models;
using PracticaWeb.Entities;
using System.Diagnostics;
using Dapper;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace PracticaWeb.Controllers
{
    public class HomeController(IPrincipalModel iPrincipalModel) : Controller
    {

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public ActionResult ConsultarProductos()
        {
            var respuesta = iPrincipalModel.ConsultarProductos();

            if (respuesta.Codigo == 1)
            {
                var contenido = respuesta.Contenido?.ToString();
                var options = new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true,
                    NumberHandling = JsonNumberHandling.AllowReadingFromString | JsonNumberHandling.WriteAsString
                };
                if (!string.IsNullOrEmpty(contenido))
                {
                    var datos = JsonSerializer.Deserialize<List<Principal>>(contenido, options);
                    return View(datos);
                }


            }

            return View(new List<Principal>());
        }

        [HttpGet]
        public IActionResult Abonar(int q)
        {
            var resp = iPrincipalModel.GetCompraById(q);

            if (resp.Codigo == 1)
            {
                var compra = JsonSerializer.Deserialize<Principal>((JsonElement)resp.Contenido!);
                return View(compra);
            }
            return View(new Principal());
        }


    }
}
