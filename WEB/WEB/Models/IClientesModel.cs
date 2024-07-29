using WEB.Entities;

namespace WEB.Models
{
    public interface IClientesModel
    {
        Respuesta AgregarCliente(Clientes ent);
        Respuesta ActualizarCliente(Clientes ent);
        Respuesta EliminarCliente(Clientes ent);
        Respuesta ConsultarCliente();
        Respuesta ObtenerCliente(int Id_cliente);

    }
}
