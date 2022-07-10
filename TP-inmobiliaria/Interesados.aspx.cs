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

            Interesado interesado = new Interesado();
            ListaInteresados = new List<Interesado>();

            propiedad prop = new propiedad();
            UsuarioNegocio comprador = new UsuarioNegocio();

            foreach (Favorito item in ListaFavoritos)
            {
                prop = ListaPropiedades.Find(x => x.ID == item.IdPropiedad);

                if(prop.idVendedor == vendedor.ID)
                {
                    interesado.Propiedad = prop;
                    interesado.Usuario = comprador.buscarUsuario(item.IdUsuario);

                    if(interesado.Usuario.ID != -1) ListaInteresados.Add(interesado);
                }
            }
        }
    }
}