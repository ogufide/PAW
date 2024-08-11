using WEB.Entities;

namespace WEB.Models
{
    public interface IProvinciasModel
    {
        Respuesta ConsultarProvincia();
        Respuesta ObtenerProvincia(int Id_provincia);
    }
}
