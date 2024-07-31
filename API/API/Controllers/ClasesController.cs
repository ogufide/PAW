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
    public class ClasesController(IConfiguration iConfiguration) : ControllerBase
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("CreateClase")]
        public async Task<IActionResult> CreateClase(Clase ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CreateClase", new { ent.Nombre, ent.Descripcion, ent.IdInstructor, ent.Horario, ent.Duracion, ent.CapacidadMaxima, ent.Estado }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Esta clase ya existe.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ReadClase")]
        public async Task<IActionResult> ReadClase()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Plan>("ReadClase", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay clases disponibles.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ReadClaseById")]
        public async Task<IActionResult> ReadClaseById(int Id_clase)
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Plan>("ReadClaseById", new { Id_clase }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Esta clase no esta disponible.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("UpdateClase")]
        public async Task<IActionResult> UpdateClase(Clase ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var parameters = new DynamicParameters();
                parameters.Add("@Id_clase", ent.Id_clase);
                parameters.Add("@Nombre", ent.Nombre);
                parameters.Add("@Descripcion", ent.Descripcion);
                parameters.Add("@IdInstructor", ent.IdInstructor);
                parameters.Add("@Horario", ent.Horario);
                parameters.Add("@Duracion", ent.Duracion);
                parameters.Add("@CapacidadMaxima", ent.CapacidadMaxima);

                var result = await context.ExecuteAsync("UpdateClase", parameters, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se actualizó la clase.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro actualizar la clase.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("DeleteClase")]
        public async Task<IActionResult> DeleteClase(int Id_clase)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetConnectionString("DefaultConnection")))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("DeleteClase", new { Id_clase }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Se elimino la clase.";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se logro eliminar la clase.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }
    }
}
