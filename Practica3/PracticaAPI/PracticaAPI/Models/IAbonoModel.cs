using PracticaAPI.Entities;

namespace PracticaAPI.Models
{
    public interface IAbonoModel
    {
        Respuesta RegistrarAbonoyActualizar(Abono ent);
    }
}
