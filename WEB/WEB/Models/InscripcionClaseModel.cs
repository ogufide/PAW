using Microsoft.Extensions.Configuration;
using System.Configuration;
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
        public Respuesta ReadInscripcion()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "InscripcionClase/ReadInscripcion";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
        public Respuesta UpdateInscripcion(InscripcionClases ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "InscripcionClase/UpdateInscripcion";
                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta DeleteInscripcion(int Id_inscripcion)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "InscripcionClase/DeleteInscripcion?Id_inscripcion=" + Id_inscripcion;

                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta GetInscripcionById(int Id_inscripcion)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "InscripcionClase/GetInscripcionById?Id_inscripcion=" + Id_inscripcion;
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }
    
}
