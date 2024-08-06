using WEB.Entities;
using System.Net.Http;
using System.Net.Http.Headers;

namespace WEB.Models
{
    public class UsuarioModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iContextAccesor) : IUsuarioModel
    {
        public Respuesta CreateUsuario(Usuario ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/CreateUsuario";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta IniciarSesion(Usuario ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/IniciarSesion";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ReadUsuarios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/ReadUsuarios";
                string token = iContextAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta GetUsuarioById(int Identificacion)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuario/GetUsuarioById?Identificacion=" + Identificacion;
                string token = iContextAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }
}
