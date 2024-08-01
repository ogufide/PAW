namespace API.Entities
{
    public class Gimnasios
    {
        public int Id_gimnasio { get; set; }
        public string? Nombre { get; set; }
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public int Id_provincia { get; set; }
        public bool? Estado { get; set; }

    }
}
