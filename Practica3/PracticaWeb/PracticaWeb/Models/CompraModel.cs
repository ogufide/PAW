using PracticaWeb.Entities;
using System.Net.Http.Headers;

namespace PracticaWeb.Models
{
    public class CompraModel(HttpClient httpClient, IConfiguration iConfiguration) : ICompraModel
    {
        public Respuesta GetCompraById(int CodigoCompra)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Compra/GetCompraById?CodigoCompra=" + CodigoCompra;

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
        public Respuesta Abonar(Compra ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Compra/Abonar";

                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }
}
