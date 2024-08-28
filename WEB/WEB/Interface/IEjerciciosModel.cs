using WEB.Entities;

namespace WEB.Interface
{
    public interface IEjerciciosModel
    {
        Respuesta CreateEjercicio(Ejercicio ent);

        Respuesta ReadEjercicios();

        Respuesta UpdateEjercicio(Ejercicio ent);

        Respuesta DeleteEjercicio(int Id_ejercicio);

    }
}
