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
                        //esta tiene que ser la accion del boton todavia falta modificar eso
                        //seteamos el estado a 0 en donde ya leímos la propiedad y no necesitamos viendola más
                        favorito.setearEstado(item.IdUsuario, item.IdPropiedad);
                        if (interesado.Usuario.ID != -1) ListaInteresados.Add(interesado);
                    }

                }
            }

        }
    }
}