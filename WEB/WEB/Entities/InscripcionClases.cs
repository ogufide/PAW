using Microsoft.AspNetCore.Mvc.Rendering;

namespace WEB.Entities
{
    public class InscripcionClases
    {
        public int? Id_inscripcion { get; set; }
        public int? Id_cliente { get; set; }
        public int? IdClase { get; set; }
        public IEnumerable<SelectListItem>? NombreClase { get; set; }
        public IEnumerable<SelectListItem>? NombreCliente { get; set; }
        public DateTime? FechaInscripcion { get; set; }
    }
}
