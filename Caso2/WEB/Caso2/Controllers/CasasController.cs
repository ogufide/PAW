using Microsoft.AspNetCore.Mvc;

namespace Caso2.Controllers
{
    public class CasasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
