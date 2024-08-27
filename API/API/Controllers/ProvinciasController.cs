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
    public class ProvinciasController(IConfiguration iConfiguration) : ControllerBase
    {

        [AllowAnonymous]
        [HttpGet]
        [Route("ConsultarProvincia")]
        public async Task<IActionResult> ConsultarProvincia()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Provincias>("ConsultarProvincia", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay provincias registradas en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerProvincia")]
        public async Task<IActionResult> ObtenerProvincia(int Id_provincia)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var provincia = await context.QueryFirstOrDefaultAsync<Provincias>("ObtenerProvincia", new { Id_provincia }, commandType: CommandType.StoredProcedure);

                if (provincia != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Provincia obtenida correctamente";
                    resp.Contenido = provincia;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontro la provincia.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }

        }



    }
}
