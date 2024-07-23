namespace API.Entities
{
    public class Ejercicio
    {
        public int Id_ejercicio { get; set; }
        public string? Nombre { get; set; }
        public string? Descripcion { get; set; }
        public string? GrupoMuscular { get; set; }
        public string? EquipoNecesario { get; set; }
    }
}
