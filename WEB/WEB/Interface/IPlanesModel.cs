using WEB.Entities;

namespace WEB.Interface
{
    public interface IPlanesModel
    {
        Respuesta CreatePlan(Plan ent);

        Respuesta ReadPlan();

        Respuesta UpdatePlan(Plan ent);

        Respuesta DeletePlan(int Id_plan);
    }
}
