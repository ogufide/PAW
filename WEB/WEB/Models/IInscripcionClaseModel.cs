using WEB.Entities;

namespace WEB.Models
{
    public interface IInscripcionClaseModel
    {
        Respuesta AgregarClase(InscripcionClases ent);
        Respuesta ReadInscripcion();
        Respuesta UpdateInscripcion(InscripcionClases ent);
        Respuesta DeleteInscripcion(int Id_inscripcion);
        Respuesta GetInscripcionById(int id_inscripcion);

    }
}
