using WEB.Entities;

namespace WEB.Interface
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
