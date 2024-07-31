using WEB.Entities;

namespace WEB.Models
{
    public interface IEmpleadosModel
    {
        Respuesta AgregarEmpleado(Empleados ent);
        Respuesta ActualizarEmpleado(Empleados ent);
        Respuesta EliminarEmpleado(int Id_empleado);
        Respuesta ConsultarEmpleado();
        Respuesta ObtenerEmpleado(int Id_empleado);

    }
}
