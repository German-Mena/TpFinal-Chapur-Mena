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
        public List<propiedad> listaPropiedades { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int idPropiedad;
            int.TryParse(Request.QueryString["idPropiedad"], out idPropiedad);

            propiedadNegocio propiedades = new propiedadNegocio();
            listaPropiedades = propiedades.listar();
            propiedad = listaPropiedades.Find(x => x.ID == idPropiedad);

            multimediaNegocio multimedia = new multimediaNegocio();
            listaMultimedia = multimedia.listarMultimedia(idPropiedad);
        }

    }
}