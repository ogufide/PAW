using WEB.Entities;

namespace WEB.Models
{
    public interface IEjerciciosModel
    {
        Respuesta CreateEjercicio(Ejercicio ent);

        Respuesta ReadEjercicios();

    }
}
