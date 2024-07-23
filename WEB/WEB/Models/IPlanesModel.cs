using WEB.Entities;

namespace WEB.Models
{
    public interface IPlanesModel
    {
        Respuesta CreatePlan(Plan ent);

        Respuesta ReadPlan();

        Respuesta ReadPlanById(int Id_plan);
    }
}
