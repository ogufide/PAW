using PracticaAPI.Entities;
using static PracticaAPI.Models.PrincipalModel;
using System.Net.Http.Headers;
namespace PracticaAPI.Models
{
    public class PrincipalModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iContextAccesor) : IPrincipalModel
    {

        public Respuesta ConsultarProductos()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Principal/ConsultarProductos";

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer");
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ObtenerCompras()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Principal/ConsultarProductos";

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer");
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarSaldo()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Principal/ConsultarProductos";

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer");
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public Respuesta RegistrarAbonoyActualizar(Abono ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Principal/RegistrarAbonoyActualizar";
                
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
