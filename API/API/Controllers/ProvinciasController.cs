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
        public async Task<IActionResult> ConsultarProvincia(int id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Gimnasios>("ConsultarProvincia", new { @Id_provincia = id }, commandType: CommandType.StoredProcedure);

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
    }
}
