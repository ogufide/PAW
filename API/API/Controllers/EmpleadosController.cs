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
    public class EmpleadosController(IConfiguration iConfiguration) : ControllerBase
    {

        [AllowAnonymous]
        [HttpGet]
        [Route("AgregarEmpleado")]
        public async Task<IActionResult> AgregarEmpleado(Empleados ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("AgregarEmpleado", new { ent.Id_empleado, ent.Nombre, ent.Apellidos, ent.FechaNacimiento
                , ent.Genero, ent.Direccion, ent.Telefono, ent.Correo, ent.Puesto, ent.FechaContratacion, ent.Salario, ent.Estado}, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "La información del empleado ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


        [AllowAnonymous]
        [HttpGet]
        [Route("ActualizarEmpleado")]
        public async Task<IActionResult> ActualizarEmpleado(int id, Empleados ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("ActualizarEmpleado", new
                {
                    Id_empleado = id,
                    ent.Nombre,
                    ent.Apellidos,
                    ent.FechaNacimiento,
                    ent.Genero,
                    ent.Direccion,
                    ent.Telefono,
                    ent.Correo,
                    ent.Puesto,
                    ent.FechaContratacion,
                    ent.Salario,
                    ent.Estado
                }, commandType: CommandType.StoredProcedure);


                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Empleado actualizado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontró el empleado para actualizar.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }

        }


        [AllowAnonymous]
        [HttpGet]
        [Route("EliminarEmpleado")]
        public async Task<IActionResult> EliminarEmpleado(int id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("EliminarEmpleado", new { Id_empleado = id }, commandType: CommandType.StoredProcedure);

                
                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Empleado marcado como eliminado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontró el empleado para eliminar.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }
        }


        [AllowAnonymous]
        [HttpGet]
        [Route("ConsultarEmpleados")]
        public async Task<IActionResult> ConsultarEmpleados()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var empleados = await context.QueryAsync<Empleados>("ConsultarEmpleados", commandType: CommandType.StoredProcedure);

                if (empleados != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Empleados obtenidos correctamente";
                    resp.Contenido = empleados;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontraron empleados.";
                    resp.Contenido = null;
                    return NotFound(resp);
                }
            }
        }


    }
}



