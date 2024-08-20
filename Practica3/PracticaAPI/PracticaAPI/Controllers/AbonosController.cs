using PracticaAPI.Entities;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Mvc;
using Dapper;

namespace PracticaAPI.Controllers
{
    public class AbonosController(IConfiguration iConfiguration) : ControllerBase
    {
        [HttpPost]
        [Route("RegistrarAbonoyActualizar")]
        public async Task<IActionResult> RegistrarAbonoyActualizar(Abono ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("RegistrarAbonoyActualizar", new { ent.CodigoCompra, ent.MontoAbono, ent.FechaAbono }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Este abono ya esta activo.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }
}
