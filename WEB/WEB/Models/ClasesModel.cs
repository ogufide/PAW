using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using WEB.Entities;

namespace WEB.Models
{
    public class ClasesModel(HttpClient httpClient, IConfiguration iConfiguration) : IClasesModel
    {

        public Respuesta CreateClase(Clase ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clase/CrearClase";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadClases()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clase/ReadClases";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadClasesById(int Id_clase)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clase/ReadClaseById?Id_clase=" + Id_clase;
                
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        //public Respuesta UpdateClase()
        //{
        //    using (httpClient)
        //    {
        //        string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clase/UpdateClase";

        //        var resp = httpClient.GetAsync(url).Result;

        //        if (resp.IsSuccessStatusCode)
        //            return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
        //        else
        //            return new Respuesta();
        //    }
        //}

        //public Respuesta DeleteClase()
        //{
        //    using (httpClient)
        //    {
        //        string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clase/DeleteClase";

        //        var resp = httpClient.GetAsync(url).Result;

        //        if (resp.IsSuccessStatusCode)
        //            return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
        //        else
        //            return new Respuesta();
        //    }
        //}

    }
}
