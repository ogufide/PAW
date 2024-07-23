using WEB.Entities;

namespace WEB.Models
{
    public interface IUsuarioModel
    {
        Respuesta CreateUsuario(Usuario ent);

        Respuesta IniciarSesion(Usuario ent);
        Respuesta ReadUsuarios();
        Respuesta GetUsuarioById(int Identificacion);
    }
}
