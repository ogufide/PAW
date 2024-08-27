using Microsoft.AspNetCore.Mvc.Rendering;

namespace WEB.Entities
{
    public class Rutina
    {
        public int? Id_rutina { get; set; }
        public int? Id_plan { get; set; }
        public string? Nombre { get; set; }
        public string? Descripcion { get; set; }
        public string? DiaSemana { get; set; }
        public string? NombrePlan { get; set; }
        public IEnumerable<SelectListItem>? SelectedNombrePlan { get; set; }
    }
}
