using WEB.Entities;

namespace WEB.Interface
{
    public interface IClientesModel
    {
        Respuesta AgregarCliente(Clientes ent);
        Respuesta ActualizarCliente(Clientes ent);
        Respuesta EliminarCliente(int Id_cliente);
        Respuesta ConsultarCliente();
        Respuesta ObtenerCliente(int Id_cliente);

    }
}
