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
    public partial class agregarPropiedad : System.Web.UI.Page
    {
        public List<tipoPropiedad> listaTiposPropiedad { get; set; }
        public List<tipoContrato> listaTiposContrato { get; set; }
        public List<Usuario> listaVendedores { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarDropdowns();
        }

        protected void cargarDropdowns()
        {   
            tipoPropiedadNegocio tipoPropiedad = new tipoPropiedadNegocio();
            listaTiposPropiedad = tipoPropiedad.listar();
            Session.Add("listaTiposPropiedad", listaTiposPropiedad);
            ddlTipoPropiedad.DataSource = listaTiposPropiedad;
            ddlTipoPropiedad.DataTextField = "descripcion";
            ddlTipoPropiedad.DataValueField = "id";
            ddlTipoPropiedad.DataBind();

            tipoContratoNegocio tipoContrato = new tipoContratoNegocio();
            listaTiposContrato = tipoContrato.listar();
            Session.Add("listaTiposContrato", listaTiposContrato);
            ddlTipoContrato.DataSource = listaTiposContrato;
            ddlTipoContrato.DataTextField = "descripcion";
            ddlTipoContrato.DataValueField = "id";
            ddlTipoContrato.DataBind();

            UsuarioNegocio usuario = new UsuarioNegocio();
            listaVendedores = usuario.listarVendedores();
            Session.Add("listaVendedores", listaVendedores);
            ddlVendedorAsignado.DataSource = listaVendedores;
            ddlVendedorAsignado.DataTextField = "Nombre";
            ddlVendedorAsignado.DataValueField = "ID";
            ddlVendedorAsignado.DataBind();
            ddlVendedorAsignado.Items.Insert(0, new ListItem("Seleccionar Vendedor", "NA"));
        }

        protected void ddlTipoPropiedad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int id = int.Parse(ddlTipoPropiedad.SelectedItem.Value);
                ddlTipoPropiedad.DataSource = ((List<tipoPropiedad>)Session["listaTiposPropiedad"]).FindAll(x => x.id == id);
                ddlTipoPropiedad.DataBind();
            }
        }

        protected void ddlTipoContrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int id = int.Parse(ddlTipoContrato.SelectedItem.Value);
                ddlTipoContrato.DataSource = ((List<tipoContrato>)Session["listaTiposContrato"]).FindAll(x => x.id == id);
                ddlTipoContrato.DataBind();
            }
        }

        protected void ddlVendedorAsignado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int id = int.Parse(ddlVendedorAsignado.SelectedItem.Value);
                ddlVendedorAsignado.DataSource = ((List<Usuario>)Session["listaVendedores"]).FindAll(x => x.ID == id);
                ddlVendedorAsignado.DataBind();
            }
        }

    }

}