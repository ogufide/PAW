using WEB.Entities;

namespace WEB.Interface
{
    public interface IRolModel
    {
        Respuesta ReadRoles();
        Respuesta ReadRolesMant();
        Respuesta CreateRol(Rol ent);
    }
}
