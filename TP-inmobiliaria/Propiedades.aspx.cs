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

        public List<tipoPropiedad> listaTipos { get; set; }

        public List<tipoContrato> listaContrato { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar();
        }

        private void cargar()
        {
            propiedadNegocio propiedad = new propiedadNegocio();
            listaPropiedades = propiedad.listarPropiedades_cards();
            Session.Add("listaPropiedades", listaPropiedades);
            try
            {
                if (!IsPostBack)
                {
                    llamarDesplegable();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
        protected void btnCargar_Click(object sender, EventArgs e)
        {
            string idPropiedad = ddlTipoPropiedad.Text;
            string idContrato = ddlTipoContrato.Text;
            propiedadNegocio propiedad = new propiedadNegocio();
            listaPropiedades = propiedad.listarPropiedades_cards(idPropiedad,idContrato);
            Session.Add("listaPropiedades", listaPropiedades);
        }
        protected void llamarDesplegable()
        {   //conseguimos para el desplegable de tipoPropiedad
            tipoPropiedadNegocio tipoProp = new tipoPropiedadNegocio();
            listaTipos = tipoProp.listar();
            Session.Add("listaTipos", listaTipos);
            ddlTipoPropiedad.DataSource = listaTipos;
            ddlTipoPropiedad.DataTextField = "descripcion";
            ddlTipoPropiedad.DataValueField = "id";
            ddlTipoPropiedad.DataBind();
            //conseguimos para el desplegable de tipoContrato
            tipoContratoNegocio tipoCont = new tipoContratoNegocio();
            listaContrato = tipoCont.listar();
            Session.Add("listaContrato", listaContrato);
            ddlTipoContrato.DataSource = listaContrato;
            ddlTipoContrato.DataTextField = "descripcion";
            ddlTipoContrato.DataValueField = "id";
            ddlTipoContrato.DataBind();
        }

        protected void ddlTipoContrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int id = int.Parse(ddlTipoContrato.SelectedItem.Value);
                ddlTipoPropiedad.DataSource = ((List<tipoContrato>)Session["listaContrato"]).FindAll(x => x.id == id);
                ddlTipoPropiedad.DataBind();
            }
        }

        protected void ddlTipoPropiedad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int id = int.Parse(ddlTipoPropiedad.SelectedItem.Value);
                ddlTipoPropiedad.DataSource = ((List<tipoPropiedad>)Session["listaTipos"]).FindAll(x => x.id == id);
                ddlTipoPropiedad.DataBind();
            }
        }
    }
}