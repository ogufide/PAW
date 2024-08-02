using Microsoft.Extensions.Configuration;
using System.Net.Http;
using WEB.Entities;

namespace WEB.Models
{
    public class InscripcionClaseModel(HttpClient httpClient, IConfiguration iConfiguration) : IInscripcionClaseModel
    {
        public Respuesta AgregarClase(InscripcionClases ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "InscripcionClase/AgregarClase";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }
}
