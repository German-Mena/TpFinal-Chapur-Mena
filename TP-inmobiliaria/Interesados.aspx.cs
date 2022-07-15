using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TP_inmobiliaria
{
    public partial class Interesados : System.Web.UI.Page
    {
        public List<propiedad> ListaPropiedades { get; set; }
        public List<Favorito> ListaFavoritos { get; set; }
        public List<Interesado> ListaInteresados { get; set; }

        public Interesado interes; 

        int idUsuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {   
            cargar();
            
        }
        private void cargar()
        {
            propiedadNegocio propiedad = new propiedadNegocio();
            ListaPropiedades = propiedad.listar();

            Usuario vendedor = (Usuario)Session["User"];
            FavoritoNegocio favorito = new FavoritoNegocio();
            ListaFavoritos = favorito.listarFavoritos();

            ListaInteresados = new List<Interesado>();

            propiedad prop = new propiedad();
            UsuarioNegocio comprador = new UsuarioNegocio();
            Interesado interes = new Interesado();
            foreach (Favorito item in ListaFavoritos)
            {
                prop = ListaPropiedades.Find(x => x.ID == item.IdPropiedad);
                
                if(prop.idVendedor == vendedor.ID)
                {
                    
                    if (item.Estado == true)
                    {
                        //Tengo que declarar el obj antes de cargarlo, si no siempre agrega el primero.
                        Interesado interesado = new Interesado();

                        interesado.Propiedad = prop;
                        interesado.Usuario = comprador.buscarUsuario(item.IdUsuario);
                        if (item.Mensaje != "")
                        {
                            interesado.Mensaje = "Mensaje del interesado: " + item.Mensaje;
                        }
                        else interesado.Mensaje = "";
                        if (interesado.Usuario.ID != -1) ListaInteresados.Add(interesado);
                    }

                }
            }

        }

        protected void btn_Eliminar_Click1(object sender, EventArgs e)
        {
            int idUsuario = interes.Usuario.ID;
            int idPropiedad = interes.Propiedad.ID;
            FavoritoNegocio favorito = new FavoritoNegocio();
            favorito.setearEstado(idUsuario,idPropiedad);
        }
    }
}