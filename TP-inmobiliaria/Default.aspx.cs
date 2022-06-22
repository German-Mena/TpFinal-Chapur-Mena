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
    public partial class Default : System.Web.UI.Page
    {
        public List<propiedad> listaPropiedades { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar();
        }

        private void cargar()
        {
            propiedadNegocio propiedad = new propiedadNegocio();
            listaPropiedades = propiedad.listarPropiedades_cards();
            Session.Add("Propiedades", listaPropiedades);

            //dgvTable.DataSource = listaPropiedades;
            //dgvTable.DataBind();
            //cargarImagen(listaPropiedades[0].link);
        }

    }
}