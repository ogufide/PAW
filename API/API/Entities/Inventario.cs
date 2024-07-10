namespace API.Entities
{
    public class Inventario
    {
        public string? Nombre { get; set; }
        public string? Descripcion { get; set; }
        public int? CantidadStock { get; set; }
        public decimal Precio { get; set; }
        public string? Estado { get; set; }
    }
}
