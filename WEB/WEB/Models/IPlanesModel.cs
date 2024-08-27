using WEB.Entities;

namespace WEB.Models
{
    public interface IPlanesModel
    {
        Respuesta CreatePlan(Plan ent);

        Respuesta ReadPlan();

        Respuesta GetPlanById(int Id_plan);

        Respuesta UpdatePlan(Plan ent);

        Respuesta DeletePlan(int Id_plan);
    }
}
