using API.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using Dapper;
using System.Threading.Tasks;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InventarioController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public InventarioController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [Authorize]
        [HttpPost]
        [Route("CreateProducto")]
        public async Task<IActionResult> CreateProducto(Inventario producto)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(_configuration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("sp_InsertarProducto", new
                {
                    producto.Nombre,
                    producto.Descripcion,
                    producto.CantidadStock,
                    producto.Precio,
                    producto.Estado
                }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Producto creado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al crear el producto";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [Authorize]
        [HttpGet]
        [Route("ReadProductos")]
        public async Task<IActionResult> ReadProductos()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(_configuration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Inventario>("sp_ObtenerProductos", commandType: CommandType.StoredProcedure);

                if (result.Any())
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay productos registrados en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [Authorize]
        [HttpGet]
        [Route("GetVentasProductoById")]
        public async Task<IActionResult> GetVentasProductoById(int id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(_configuration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QuerySingleOrDefaultAsync<Inventario>("GetVentasProductoById", new { Id_producto = id }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Producto no encontrado";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [Authorize]
        [HttpPut]
        [Route("UpdateProducto")]
        public async Task<IActionResult> UpdateProducto(Inventario ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(_configuration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("sp_ActualizarProducto", new
                {
                    ent.Nombre,
                    ent.Descripcion,
                    ent.CantidadStock,
                    ent.Precio,
                    ent.Estado
                }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Producto actualizado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al actualizar el producto";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [Authorize]
        [HttpDelete]
        [Route("DeleteProducto")]
        public async Task<IActionResult> DeleteProducto(int id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(_configuration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("sp_EliminarProducto", new { Id_producto = id }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "Producto eliminado correctamente";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al eliminar el producto";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }
}
