using API.Entities;
using API.Models;
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
    public class RolController(IConfiguration iConfiguration, IComunesModel iComunesModel) : ControllerBase
    {
        [Authorize]
        [HttpPost]
        [Route("CreateRol")]
        public async Task<IActionResult> CreateRol(Rol ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CreateRol", new { ent.Descripcion, ent.Estado }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "La información del usuario ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [Authorize]
        [HttpGet]
        [Route("ReadRoles")]
        public async Task<IActionResult> ReadRoles()
        {
            if (!iComunesModel.EsAdministrador(User))
                return StatusCode(403);

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Rol>("ReadRoles", new { }, commandType: CommandType.StoredProcedure);

                if (result.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay roles registrados en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }
}
