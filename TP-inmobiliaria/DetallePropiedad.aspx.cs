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
    public partial class DetallePropiedad : System.Web.UI.Page
    {
        public propiedad propiedad { get; set; }
        public List<multimedia> listaMultimedia { get; set; }
        //public int idPropiedad { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            int idPropiedad;
            int.TryParse(Request.QueryString["idPropiedad"], out idPropiedad);

            List<propiedad> listaPropiedades = (List<propiedad>)Session["listaPropiedades"];
            propiedad = listaPropiedades.Find(x => x.ID == idPropiedad);

            multimediaNegocio multimedia = new multimediaNegocio();
            listaMultimedia = multimedia.listarMultimedia(idPropiedad);

        }
    }
}