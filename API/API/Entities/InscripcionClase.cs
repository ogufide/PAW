namespace API.Entities
{
    public class InscripcionClase
    {
        public int Id_inscripcion { get; set; }
        public int Id_cliente { get; set; }
        public int IdClase { get; set; }
        public string ?NombreClase { get; set; }
        public string ?NombreCliente { get; set; }
        public DateTime FechaInscripcion { get; set; }

    }
}
