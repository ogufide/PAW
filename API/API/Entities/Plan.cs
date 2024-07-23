namespace API.Entities
{
    public class Plan
    {
        public int Id_plan { get; set; }
        public string? Nombre { get; set; }
        public int? Precio { get; set; }
        public string? Descripcion { get; set; }
        public int? Gimnasio_codigo { get; set; }
        public int? Estado { get; set; }
    }
}
