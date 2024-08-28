using WEB.Entities;

namespace WEB.Interface
{
    public interface IClasesModel
    {
        Respuesta CreateClase(Clase ent);

        Respuesta ReadClases();

        Respuesta ReadClaseById(int Id_clase);

        Respuesta UpdateClase(Clase ent);

        Respuesta DeleteClase(int Id_clase);

    }
}
