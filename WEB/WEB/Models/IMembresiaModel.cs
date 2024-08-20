using WEB.Entities;

namespace WEB.Models
{
    public interface IMembresiaModel
    {
        Respuesta CreateMembresia(Membresia ent);

        Respuesta ReadMembresia();
    }
}
