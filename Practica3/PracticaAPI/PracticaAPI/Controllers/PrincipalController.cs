using Microsoft.AspNetCore.Mvc;
using PracticaAPI.Entities;
using System.Data;
using System.Data.SqlClient;
using Dapper;

namespace PracticaAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrincipalController (IConfiguration iConfiguration) : ControllerBase 
    {

        [HttpGet]
        [Route("ConsultarProductos")]
        public async Task<IActionResult> ConsultarProductos()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Principal>("ConsultarProductos", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay productos.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpGet]
        [Route("ObtenerCompras")]
        public async Task<IActionResult> ObtenerCompras()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Principal>("ObtenerCompras", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay compras.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
      
        [HttpGet]
        [Route("ConsultarSaldo")]
        public async Task<IActionResult> ConsultarSaldo()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Principal>("ConsultarSaldo", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay saldos pendientes.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpPost]
        [Route("RegistrarAbonoyActualizar")]
        public async Task<IActionResult> RegistrarAbonoyActualizar(Abono ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("RegistrarAbonoyActualizar", new { ent.Id_Compra, ent.Monto, ent.Fecha }, commandType: CommandType.StoredProcedure);

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