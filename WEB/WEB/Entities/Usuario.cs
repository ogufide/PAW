﻿namespace WEB.Entities
{
    public class Usuario
    {
        public int Identificacion { get; set; }
        public string? Nombre { get; set; }
        public string? Correo { get; set; }
        public string? Contrasenna { get; set; }
        public string? Token { get; set; }
        public string? Descripcion { get; set; }
        public string? Estado { get; set; }
        public int Id_rol { get; set; }
        public bool EsTemporal { get; set; }
        public DateTime VigenciaTemporal { get; set; }

    }
}
