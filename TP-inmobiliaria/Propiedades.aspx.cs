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
    public partial class WebForm1 : System.Web.UI.Page
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
            Session.Add("listaPropiedades", listaPropiedades);
        }

        //protected void btn_verPropiedad_Click(object sender, EventArgs e)
        //{
        //    int IdPropiedad = 1;
        //    Response.Redirect("DetallePropiedad.aspx?IdPropiedad=" + IdPropiedad , false);
        //    //PARA UN FUTURO: tener en cuenta que esta pasando debajo de esta linea
        //}


    }
}