namespace WEB.Entities
{
    public class Empleados
    {
        public int Id_empleado { get; set; }
        public string? Nombre { get; set; }
        public string? Apellidos { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string? Genero { get; set; }
        public string? Direccion { get; set; }
        public string? Telefono { get; set; }
        public string? Correo { get; set; }
        public string? Puesto { get; set; }
        public DateTime? FechaContratacion { get; set; }
        public Decimal? Salario { get; set; }
        public bool? Estado { get; set; }

    }
}
