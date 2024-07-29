using WEB.Entities;

namespace WEB.Models
{
    public interface IGimnasiosModel
    {
        Respuesta AgregarGimnasio(Gimnasios ent);
        Respuesta ActualizarGimnasio(Gimnasios ent, int Id_empleado);
        Respuesta EliminarGimnasio(Gimnasios ent);
        Respuesta ConsultarGimnasio();
        Respuesta ObtenerGimnasio(int Id_gimnasio);

    }
}
