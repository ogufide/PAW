﻿using WEB.Entities;
using Microsoft.Extensions.Configuration;
using System.Net.Http.Headers;
using System.Net.Http;

namespace WEB.Models
{
    public class RolModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iContextAccesor) : IRolModel
    {
        public Respuesta ReadRoles()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Rol/ReadRoles";
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
