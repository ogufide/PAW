using WEB.Entities;

namespace WEB.Interface
{
    public interface IInscripcionClaseModel
    {
        Respuesta AgregarClase(InscripcionClases ent);
        Respuesta ReadInscripcion();
        Respuesta UpdateInscripcion(InscripcionClases ent);
        Respuesta DeleteInscripcion(InscripcionClases ent);
        Respuesta GetInscripcionById(int id_inscripcion);

    }
}
