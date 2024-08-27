
using WEB.Entities;

namespace WEB.Models
{
    public interface IRutinaModel
    {
        Respuesta CreateRutina(Rutina ent);
        Respuesta ReadRutina();
        Respuesta UpdateRutina(Rutina ent);
        Respuesta DeleteRutina(Rutina ent);
        Respuesta GetRutinaById(int Id_rutina);

    }
}
