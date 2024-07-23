using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class ClasesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
