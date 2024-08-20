namespace PracticaAPI.Entities
{
    public class Abono
    {
        public int Id_abono { get; set; }
        public string? CodigoCompra { get; set; }
        public decimal? MontoAbono { get; set; }
        public DateOnly? FechaAbono { get; set; }
    }
}
