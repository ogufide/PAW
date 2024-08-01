using API.Entities;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EjerciciosController(IConfiguration iConfiguration) : ControllerBase
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("CreateEjercicio")]
        public async Task<IActionResult> CreateEjercicio(Ejercicio ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CreateEjercicio", new { ent.Nombre, ent.Descripcion, ent.GrupoMuscular, ent.EquipoNecesario }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Este ejercicio ya existe.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ReadEjercicio")]
        public async Task<IActionResult> ReadEjercicio()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Plan>("ReadEjercicio", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay ejercicios disponibles.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("UpdateEjercicio")]
        public async Task<IActionResult> UpdateEjercicio(Ejercicio ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var parameters = new DynamicParameters();
                parameters.Add("@Id_ejercicio", ent.Id_ejercicio);
                parameters.Add("@Nombre", ent.Nombre);
                parameters.Add("@Descripcion", ent.Descripcion);
                parameters.Add("@GrupoMuscular", ent.GrupoMuscular);
                parameters.Add("@EquipoNecesario", ent.EquipoNecesario);

                var result = await context.ExecuteAsync("UpdateEjercicio", parameters, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se actualizó el ejercicio.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro actualizar el ejercicio.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("DeleteEjercicio")]
        public async Task<IActionResult> DeleteEjercicio(int Id_ejercicio)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetConnectionString("DefaultConnection")))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("DeleteEjercicio", new { Id_ejercicio }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se elimino el ejercicio.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro eliminar el ejercicio.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }
    }
}
