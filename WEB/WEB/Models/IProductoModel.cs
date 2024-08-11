using WEB.Entities;

namespace JN_WEB.Models
{
    public interface IProductoModel
    {
        Respuesta ReadProductos();
        Respuesta CreateProducto(Producto ent);

    }
}
