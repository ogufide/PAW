using API.Entities;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Dapper;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InscripcionClaseController(IConfiguration iConfiguration) : ControllerBase
    {

        [Authorize]
        [HttpPost]
        [Route("AgregarClase")]
        public async Task<IActionResult> AgregarClase(InscripcionClase inscripcion)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("sp_InsertarInscripcionClase",
                    new
                    {
                        inscripcion.Id_cliente,
                        inscripcion.IdClase
                    },
                    commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Inscripción creada correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al crear la inscripción";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


    }
}
