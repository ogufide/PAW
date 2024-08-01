using API.Entities;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;
namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MembresiasController(IConfiguration iConfiguration) : ControllerBase
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("CreateMembresia")]
        public async Task<IActionResult> CreateMembresia(Membresia ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CreateMembresia", new { ent.Nombre, ent.Descripcion, ent.Precio, ent.Plan_codigo, ent.Cliente_codigo, ent.Estado }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Esta membresia ya existe.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ReadMembresia")]
        public async Task<IActionResult> ReadMembresia()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Membresia>("ReadMembresia", new { }, commandType: CommandType.StoredProcedure);

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
        [Route("GetMembresiaById")]
        public async Task<IActionResult> GetPlanById(int Id_membresia)
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Membresia>("GetMembresiaById", new { Id_membresia }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Esta membresia no esta disponible.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("UpdateMembresia")]
        public async Task<IActionResult> UpdateMembresia(Membresia ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var parameters = new DynamicParameters();
                parameters.Add("@Id_plan", ent.Id_membresia);
                parameters.Add("@Nombre", ent.Nombre);
                parameters.Add("@Precio", ent.Precio);
                parameters.Add("@Descripcion", ent.Descripcion);
                parameters.Add("@Gimnasio_codigo", ent.Plan_codigo);
                parameters.Add("@Estado", ent.Estado);

                var result = await context.ExecuteAsync("UpdateMembresia", parameters, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se actualizó la membresia.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro actualizar la membresia.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("DeleteMembresia")]
        public async Task<IActionResult> DeleteMembresia(int Id_membresia)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetConnectionString("DefaultConnection")))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("DeleteMembresia", new { Id_membresia }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se elimino la membresia.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro eliminar la membresia.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }
    }
}

