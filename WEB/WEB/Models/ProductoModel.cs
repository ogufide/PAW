using WEB.Entities;
using Microsoft.Extensions.Configuration;
using System.Net.Http.Headers;
using System.Net.Http;
using WEB.Interface;

namespace WEB.Models
{

    public class ProductoModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iContextAccesor) : IProductoModel
    {
        public Respuesta ReadProductos()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Producto/ReadProductos";
                string token = iContextAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta CreateProducto(Producto ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Producto/CreateProducto";
                string token = iContextAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                JsonContent body = JsonContent.Create(ent);
                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta InventarioProductos()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Producto/InventarioProductos";
                string token = iContextAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
