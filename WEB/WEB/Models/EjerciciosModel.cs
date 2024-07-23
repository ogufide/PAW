using Microsoft.Extensions.Configuration;
using System.Net.Http;
using WEB.Entities;

namespace WEB.Models
{
    public class EjerciciosModel(HttpClient httpClient, IConfiguration iConfiguration) : IEjerciciosModel
    {

        public Respuesta CreateEjercicio(Ejercicio ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Ejercicio/CreateEjercicio";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadEjercicios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Ejercicio/ReadEjercicios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        //public Respuesta UpdateEjercicio()
        //{
        //    using (httpClient)
        //    {
        //        string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Ejercicio/UpdateEjercicio";

        //        var resp = httpClient.GetAsync(url).Result;

        //        if (resp.IsSuccessStatusCode)
        //            return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
        //        else
        //            return new Respuesta();
        //    }
        //}

        //public Respuesta DeleteEjercicio()
        //{
        //    using (httpClient)
        //    {
        //        string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Ejercicio/DeleteEjercicio";

        //        var resp = httpClient.GetAsync(url).Result;

        //        if (resp.IsSuccessStatusCode)
        //            return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
        //        else
        //            return new Respuesta();
        //    }
        //}

    }
}
