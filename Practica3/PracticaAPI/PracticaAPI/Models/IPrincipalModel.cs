using PracticaAPI.Entities;

namespace PracticaAPI.Models
{
    public interface IPrincipalModel
    {
        Respuesta ConsultarProductos();

        Respuesta ObtenerCompras();

        Respuesta ConsultarSaldo();

        Respuesta RegistrarAbonoyActualizar(Abono ent);
    
    }
}