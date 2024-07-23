using WEB.Entities;

namespace WEB.Models
{
    public interface IClasesModel
    {
        Respuesta CreateClase(Clase ent);

        Respuesta ReadClases();

        Respuesta ReadClaseById(int Id_clase);

    }
}
