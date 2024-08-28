using WEB.Entities;

namespace WEB.Interface
{
    public interface IProvinciasModel
    {
        Respuesta ConsultarProvincia();
        Respuesta ObtenerProvincia(int Id_provincia);
    }
}
