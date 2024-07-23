using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using WEB.Entities;

namespace WEB.Models
{
    public class PlanesModel(HttpClient httpClient, IConfiguration iConfiguration) : IPlanesModel
    {

        public Respuesta CreatePlan(Plan ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Plan/CreatePlan";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadPlan()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Plan/ReadPlan";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadPlanById(int Id_plan)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Plan/ReadPlanById?Id_plan=" + Id_plan;
                
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        //public Respuesta UpdatePlan()
        //{
        //    using (httpClient)
        //    {
        //        string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Plan/UpdatePlan";

        //        var resp = httpClient.GetAsync(url).Result;

        //        if (resp.IsSuccessStatusCode)
        //            return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
        //        else
        //            return new Respuesta();
        //    }
        //}

        //public Respuesta DeletePlan()
        //{
        //    using (httpClient)
        //    {
        //        string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Plan/DeletePlan";

        //        var resp = httpClient.GetAsync(url).Result;

        //        if (resp.IsSuccessStatusCode)
        //            return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
        //        else
        //            return new Respuesta();
        //    }
        //}

    }
}
