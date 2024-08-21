namespace PracticaAPI.Entities
{
    public class Abono
    {
        public int Id_Abono { get; set; }
        public string? Id_Compra { get; set; }
        public decimal? Monto { get; set; }
        public DateOnly? Fecha { get; set; }
    }
}
