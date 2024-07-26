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
    public class GimnaciosController(IConfiguration iConfiguration) : ControllerBase
    {

        [AllowAnonymous]
        [HttpGet]
        [Route("AgregarGimnasio")]
        public async Task<IActionResult> AgregarGimnasio(Gimnasios ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("AgregarGimnasio", new { ent.Id_gimnasio, ent.Nombre, ent.Telefono, ent.Direccion, ent.Id_provincia, ent.Estado }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "La información del Gimnasio ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


        [AllowAnonymous]
        [HttpGet]
        [Route("ActualizarGimnasio")]
        public async Task<IActionResult> ActualizarGimnasio(Gimnasios ent)
        {
            Respuesta resp = new Respuesta();

            
            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                
                var result = await context.ExecuteAsync("ActualizarGimnasio", new
                {
                    @Id_gimnasio = ent.Id_gimnasio,
                    @Nombre = ent.Nombre,
                    @Telefono = ent.Telefono,
                    @Direccion = ent.Direccion,
                    @Id_provincia = ent.Id_provincia,
                    @Estado = ent.Estado
                }, commandType: CommandType.StoredProcedure);

                
                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Gimnasio actualizado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se pudo actualizar el gimnasio. Verifique los datos proporcionados.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }



        [AllowAnonymous]
        [HttpGet]
        [Route("EliminarGimnasio")]
        public async Task<IActionResult> EliminarGimnasio(int id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetConnectionString("DefaultConnection")))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("EliminarGimnasio", new { Id_gimnasio = id }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Gimnasio eliminado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontró el gimnasio para eliminar.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }


        [AllowAnonymous]
        [HttpGet]
        [Route("ConsultarGimnasio")]
        public async Task<IActionResult> ConsultarGimnasio(int id)
        {
           
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Gimnasios>("ConsultarGimnasio", new { @Id_gimnasio = id }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay Gimnasios registrados en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }



    }
}

