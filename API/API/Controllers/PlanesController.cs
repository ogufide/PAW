using API.Entities;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlanesController(IConfiguration iConfiguration) : ControllerBase
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("CreatePlan")]
        public async Task<IActionResult> CreatePlan(Plan ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CreatePlan", new { ent.Nombre, ent.Precio, ent.Descripcion, ent.Gimnasio_codigo, ent.Estado }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Este plan ya existe.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ReadPlan")]
        public async Task<IActionResult> ReadPlan()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Plan>("ReadPlan", new { }, commandType: CommandType.StoredProcedure);

                if (result != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay planes disponibles.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("GetPlanById")]
        public async Task<IActionResult> GetPlanById(int Id_plan)
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Plan>("GetPlanById", new { Id_plan }, commandType: CommandType.StoredProcedure);

                if (result != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Este plan no esta disponible.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("UpdatePlan")]
        public async Task<IActionResult> UpdatePlan(Plan ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var parameters = new DynamicParameters();
                parameters.Add("@Id_plan", ent.Id_plan);
                parameters.Add("@Nombre", ent.Nombre);
                parameters.Add("@Precio", ent.Precio);
                parameters.Add("@Descripcion", ent.Descripcion);
                parameters.Add("@Gimnasio_codigo", ent.Gimnasio_codigo);
                parameters.Add("@Estado", ent.Estado);

                var result = await context.ExecuteAsync("UpdatePlan", parameters, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se actualizó el plan.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro actualizar el plan.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("DeletePlan")]
        public async Task<IActionResult> DeletePlan(int Id_plan)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetConnectionString("DefaultConnection")))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("DeletePlan", new { Id_plan }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se elimino el plan.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro eliminar el plan.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }
    }
}
