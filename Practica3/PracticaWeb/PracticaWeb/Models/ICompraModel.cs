using PracticaWeb.Entities;

namespace PracticaWeb.Models
{
    public interface ICompraModel
    {
        Respuesta Abonar(Compra ent);
        Respuesta GetCompraById(int CodigoCompra);


    }
}
