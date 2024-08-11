using WEB.Entities;

namespace WEB.Models
{
    public class ProvinciasModel(HttpClient httpClient, IConfiguration iConfiguration) : IProvinciasModel
    {

        public Respuesta ConsultarProvincia()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Provincias/ConsultarProvincia";
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ObtenerProvincia(int Id_provincia)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Provincias/ObtenerProvincia?Id_provincia=" + Id_provincia;
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


    }
}
