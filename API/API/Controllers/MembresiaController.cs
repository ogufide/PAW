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
    public class MembresiaController(IConfiguration iConfiguration) : ControllerBase
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("CreateMembresia")]
        public async Task<IActionResult> CreateMembresia(Membresia ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("CreateMembresia", new
                {
                    ent.Nombre,
                    ent.Descripcion,
                    ent.Precio,
                    ent.Plan_codigo,
                    ent.Cliente_codigo
                }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay Membresias registrados en este momento";
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
                var result = await context.ExecuteAsync("UpdateMembresia", new { ent.Id_membresia, ent.Nombre, ent.Descripcion, ent.Precio, ent.Plan_codigo, ent.Cliente_codigo }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "La información de la membresia no se pudo actualizar";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("DeleteMembresia")]
        public async Task<IActionResult> DeleteMembresia(int Id_membresia)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("DeleteMembresia", new { Id_membresia }, commandType: CommandType.StoredProcedure);


                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "La membresia se ha eliminado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontró la membresia para eliminar.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }

    
        [HttpGet]
        [Route("GetMembresiaById")]
        public async Task<IActionResult> GetMembresiaById(int Id_membresia)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QuerySingleOrDefaultAsync<Membresia>("GetMembresiaById", new { Id_membresia }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Membresia no encontrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }



    }
}
