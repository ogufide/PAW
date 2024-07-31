using API.Entities;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController(IConfiguration iConfiguration) : ControllerBase
    {

        [AllowAnonymous]
        [HttpPost]
        [Route("AgregarCliente")]
        public async Task<IActionResult> AgregarCliente(Clientes ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("AgregarCliente", new { ent.Id_cliente, ent.Nombre, ent.Apellidos, ent.Correo, ent.Telefono, ent.Estado }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "La información del Cliente ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


        [AllowAnonymous]
        [HttpPut]
        [Route("ActualizarCliente")]
        public async Task<IActionResult> ActualizarCliente(Clientes ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var parameters = new DynamicParameters();
                parameters.Add("@Nombre", ent.Nombre);
                parameters.Add("@Apellidos", ent.Apellidos);
                parameters.Add("@Correo", ent.Correo);
                parameters.Add("@Telefono", ent.Telefono);
                parameters.Add("@Estado", ent.Estado);

                var result = await context.ExecuteAsync("ActualizarCliente", parameters, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Cliente actualizado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se pudo actualizar el cliente. Verifique los datos proporcionados.";
                    resp.Contenido = false;
                    return BadRequest(resp);
                }
            }
        }


        [AllowAnonymous]
        [HttpDelete]
        [Route("EliminarCliente")]
        public async Task<IActionResult> EliminarCliente(int Id_cliente)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("EliminarCliente", new { Id_cliente }, commandType: CommandType.StoredProcedure);


                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Cliente marcado como eliminado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontró el cliente para eliminar.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }

        }


        [AllowAnonymous]
        [HttpGet]
        [Route("ConsultarCliente")]
        public async Task<IActionResult> ConsultarCliente()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var clientes = await context.QueryAsync<Clientes>("ConsultarCliente", new { }, commandType: CommandType.StoredProcedure);

                if (clientes.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Clientes obtenidos correctamente";
                    resp.Contenido = clientes;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontraron clientes.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }

        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerCliente")]
        public async Task<IActionResult> ObtenerCliente(int Id_cliente)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var clientes = await context.QueryFirstOrDefaultAsync<Clientes>("ObtenerCliente", new { Id_cliente}, commandType: CommandType.StoredProcedure);

                if (clientes != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Cliente obtenido correctamente";
                    resp.Contenido = clientes;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontro al cliente.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }

        }

    }
}

