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
    public partial class Favoritos : System.Web.UI.Page
    {   
        public List<propiedad> ListaPropiedades { get; set; }
        public List<Favorito> ListaFavoritos { get; set; }
        public List<propiedad> ListaPropiedades_filtrada { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar();

        }

        private void cargar()
        {
            propiedadNegocio propiedad = new propiedadNegocio();
            ListaPropiedades = propiedad.listarPropiedades_cards();

            Usuario user = (Usuario)Session["User"];
            FavoritoNegocio favorito = new FavoritoNegocio();
            ListaFavoritos = favorito.listarFavoritos(user.ID);

            ListaPropiedades_filtrada = new List<propiedad>();

            foreach (Favorito item in ListaFavoritos)
            {
                propiedad prop = new propiedad();
                prop = ListaPropiedades.Find(x => x.ID == item.IdPropiedad);
                ListaPropiedades_filtrada.Add(prop);
            }
        }
    }
}