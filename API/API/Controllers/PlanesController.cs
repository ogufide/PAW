using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class PlanesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
