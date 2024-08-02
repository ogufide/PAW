using Microsoft.AspNetCore.Mvc;

namespace WEB.Controllers
{
    public class ClasesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
