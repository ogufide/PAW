using PracticaWeb.Entities;

namespace PracticaWeb.Models
{
    public class PrincipalModel(HttpClient httpClient, IConfiguration iConfiguration) : IPrincipalModel
    {
        public Respuesta ConsultarProductos()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Principal/ConsultarProductos";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }


}
