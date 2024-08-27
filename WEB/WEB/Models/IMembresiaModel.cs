using WEB.Entities;

namespace WEB.Models
{
    public interface IMembresiaModel
    {
        Respuesta CreateMembresia(Membresia ent);
        Respuesta ReadMembresia();
        Respuesta DeleteMembresia(Membresia ent);
        Respuesta GetMembresiaById(int Id_membresia);
    }
}
