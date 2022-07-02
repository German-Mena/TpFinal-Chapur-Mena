using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public enum TipoUsuario
    {
        COMPRADOR = 1,
        VENDEDOR = 2,
        ADMIN = 3
    }
    public class Usuario
    {
        public int ID { get; set; }
        public string User { get; set; }
        public string Pass { get; set; }
        public TipoUsuario TipoUsuario { get; set; }
        public string Mail { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public long Telefono { get; set; }

        public Usuario(string user, string pass, int tipoUsuario, string mail, string nombre, string apellido, long telefono)
        {
            User = user;
            Pass = pass;
            //Chequear si esto funciona!
            TipoUsuario = (TipoUsuario)tipoUsuario;
            Mail = mail;
            Nombre = nombre;
            Apellido = apellido;
            Telefono = telefono;
        }

        public Usuario(string user, string pass)
        {
            User = user;
            Pass = pass;
            //TipoUsuario = (TipoUsuario)tipoUsuario;
        }
    }
}
