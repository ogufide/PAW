using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using WEB.Entities;


namespace WEB.Models
{
    public class MembresiaModel(HttpClient httpClient, IConfiguration iConfiguration) : IMembresiaModel
    {
        public Respuesta CreateMembresia(Membresia ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Membresia/CreateMembresia";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadMembresia()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Membresia/ReadMembresia";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}


