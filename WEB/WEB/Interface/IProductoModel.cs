using WEB.Entities;

namespace WEB.Interface
{
    public interface IProductoModel
    {
        Respuesta ReadProductos();
        Respuesta CreateProducto(Producto ent);

    }
}
