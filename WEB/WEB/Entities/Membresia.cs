namespace WEB.Entities
{
    public class Membresia
    {
            public int Id_membresia { get; set; }
            public string? Nombre { get; set; }
            public string? Descripcion { get; set; }
            public int? Precio { get; set; }
            public int? Plan_codigo { get; set; }
            public int? Cliente_codigo { get; set; }

    }
}
