using Microsoft.Extensions.Configuration;
using System.Net.Http;
using WEB.Entities;

namespace WEB.Models
{
    public class GimnasiosModel(HttpClient httpClient, IConfiguration iConfiguration) : IGimnasiosModel
    {
        public Respuesta AgregarGimnasio(Gimnasios ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Gimnasios/AgregarGimnasio";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ActualizarGimnasio(Gimnasios ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Gimnasios/ActualizarGimnasio";
                JsonContent body = JsonContent.Create(ent);


                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public Respuesta EliminarGimnasio(int Id_gimnasio)
        {
            using (httpClient)
            {

                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Gimnasios/EliminarGimnasio?Id_gimnasio=" + Id_gimnasio;


                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarGimnasio()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Gimnasios/ConsultarGimnasio";
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ObtenerGimnasio(int Id_gimnasio)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Gimnasios/ObtenerGimnasio?Id_gimnasio=" + Id_gimnasio;
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
