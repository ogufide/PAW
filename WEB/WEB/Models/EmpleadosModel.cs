using Microsoft.Extensions.Configuration;
using System.Net.Http;
using WEB.Entities;

namespace WEB.Models
{
    public class EmpleadosModel(HttpClient httpClient, IConfiguration iConfiguration) : IEmpleadosModel
    {
        public Respuesta AgregarEmpleado(Empleados ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Empleados/AgregarEmpleado";
                JsonContent body = JsonContent.Create(ent);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ActualizarEmpleado(Empleados ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Empleados/ActualizarEmpleado";
                JsonContent body = JsonContent.Create(ent);


                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public Respuesta EliminarEmpleado(int Id_empleado)
        {
            using (httpClient)
            {

                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Empleados/EliminarEmpleado?Id_empleado=" + Id_empleado;


                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarEmpleado()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Empleados/ConsultarEmpleado";
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ObtenerEmpleado(int Id_empleado)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Empleados/ObtenerEmpleado?Id_empleado=" + Id_empleado;
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }
}
