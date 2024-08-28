using PracticaWeb.Entities;

namespace PracticaWeb.Models
{
    public interface IPrincipalModel
    {
        Respuesta ConsultarProductos();
        Respuesta GetCompraById(int Id_Compra);
        Respuesta Abonar(Principal ent);

    }
}
