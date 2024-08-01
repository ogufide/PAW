using Microsoft.Extensions.Configuration;
using System.Net.Http;
using WEB.Entities;

namespace WEB.Models
{
    public class ClientesModel(HttpClient httpClient, IConfiguration iConfiguration) : IClientesModel
    {
        public Respuesta AgregarCliente(Clientes ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clientes/AgregarCliente";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ActualizarCliente(Clientes ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clientes/ActualizarCliente";
                JsonContent body = JsonContent.Create(ent);

               
                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public Respuesta EliminarCliente(int Id_cliente)
        {
            using (httpClient)
            {

                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clientes/EliminarCliente?Id_cliente=" + Id_cliente;

                
                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarCliente()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clientes/ConsultarCliente";
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ObtenerCliente(int Id_cliente)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Clientes/ObtenerCliente?Id_cliente=" + Id_cliente;
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
