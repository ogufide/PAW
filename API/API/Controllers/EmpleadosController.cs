﻿using API.Entities;
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
        [HttpPost]
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
        [HttpPut]
        [Route("ActualizarEmpleado")]
        public async Task<IActionResult> ActualizarEmpleado(Empleados ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var parameters = new DynamicParameters();
                parameters.Add("@Nombre", ent.Nombre);
                parameters.Add("@Apellidos", ent.Apellidos);
                parameters.Add("@FechaNacimiento", ent.FechaNacimiento);
                parameters.Add("@Genero", ent.Genero);
                parameters.Add("@Direccion", ent.Direccion);
                parameters.Add("@Telefono", ent.Telefono);
                parameters.Add("@Correo", ent.Correo);
                parameters.Add("@Puesto", ent.Puesto);
                parameters.Add("@FechaContratacion", ent.FechaContratacion);
                parameters.Add("@Salario", ent.Salario);

                var result = await context.ExecuteAsync("ActualizarEmpleado", parameters, commandType: CommandType.StoredProcedure);

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
        [HttpDelete]
        [Route("EliminarEmpleado")]
        public async Task<IActionResult> EliminarEmpleado(int Id_empleado)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var result = await context.ExecuteAsync("EliminarEmpleado", new { Id_empleado }, commandType: CommandType.StoredProcedure);

                
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
        public async Task<IActionResult> ConsultarEmpleado()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var empleados = await context.QueryAsync<Empleados>("ConsultarEmpleado", new { }, commandType: CommandType.StoredProcedure);

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


        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerEmpleado")]
        public async Task<IActionResult> ObtenerEmpleado(int Id_empleado)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                await context.OpenAsync();

                var clientes = await context.QueryFirstOrDefaultAsync<Empleados>("ObtenerEmpleado", new { Id_empleado }, commandType: CommandType.StoredProcedure);

                if (clientes != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Empleado obtenido correctamente";
                    resp.Contenido = clientes;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se encontro al empleado.";
                    resp.Contenido = false;
                    return NotFound(resp);
                }
            }

        }

    }
}



