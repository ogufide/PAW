using System.ComponentModel;

namespace WEB.Entities
{
    public class Clase
    {
        public int Id_clase { get; set; }
        public string? Nombre { get; set; }
        public string? Descripcion { get; set; }
        public int? IdInstructor { get; set; }
        public string? Horario { get; set; }
        public int? Duracion { get; set; }
        public int? CapacidadMaxima { get; set; }
        public int? Estado { get; set; }

    }
}
