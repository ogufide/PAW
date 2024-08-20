using Microsoft.Extensions.Configuration;
using PracticaAPI.Entities;
using System.Net.Http;

namespace PracticaAPI.Models
{
    public class AbonoModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iContextAccesor) : IAbonoModel
    {
        public Respuesta RegistrarAbonoyActualizar(Abono ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Abono/RegistrarAbonoyActualizar";

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
