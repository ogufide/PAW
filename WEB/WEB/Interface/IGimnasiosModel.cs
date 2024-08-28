using WEB.Entities;

namespace WEB.Interface
{
    public interface IGimnasiosModel
    {
        Respuesta AgregarGimnasio(Gimnasios ent);
        Respuesta ActualizarGimnasio(Gimnasios ent);
        Respuesta EliminarGimnasio(int Id_gimnasio);
        Respuesta ConsultarGimnasio();
        Respuesta ObtenerGimnasio(int Id_gimnasio);

    }
}
