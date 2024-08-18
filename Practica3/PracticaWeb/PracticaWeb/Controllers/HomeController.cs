using Microsoft.AspNetCore.Mvc;
using PracticaWeb.Models;
using PracticaWeb.Entities;
using System.Diagnostics;
using Dapper;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using System.Text.Json;

namespace PracticaWeb.Controllers
{
    public class HomeController(ICompraModel iCompraModel) : Controller
    {

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet]
        public IActionResult Abonar(int id)
        {
            var resp = iCompraModel.GetCompraById(id);

            if (resp.Codigo == 1)
            {
                var compra = JsonSerializer.Deserialize<Compra>((JsonElement)resp.Contenido!);
                return View(compra);
            }
            return View(new Compra());
        }


    }
}
