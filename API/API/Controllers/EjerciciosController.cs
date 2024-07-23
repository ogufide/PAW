using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class EjerciciosController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
