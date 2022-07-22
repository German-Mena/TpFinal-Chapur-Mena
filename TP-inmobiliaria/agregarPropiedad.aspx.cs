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
            //ddlVendedorAsignado.Items.Insert(0, new ListItem("Seleccionar Vendedor", "NA"));
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

        protected void btnNuevaPropiedad_Click(object sender, EventArgs e)
        {

            propiedadNegocio negocio = new propiedadNegocio();
            multimediaNegocio multimediaNegocio = new multimediaNegocio();
            ubicacionNegocio ubicacionNegocio = new ubicacionNegocio();
            ubicacion ubic;
            propiedad prop;
            try
            {

                ubic = new ubicacion(txtCalle.Text, Convert.ToInt32(txtAltura.Text), txtDepartamento.Text, txtCiudad.Text, txtProvincia.Text, txtPais.Text);
                ubicacionNegocio.Agregar(ubic);
                Session.Add("ubicacion", ubic);
                int idUbicacion = ubicacionNegocio.BuscarID(txtCalle.Text, txtAltura.Text);

                prop = new propiedad(int.Parse(ddlTipoPropiedad.SelectedItem.Value), int.Parse(ddlTipoContrato.SelectedItem.Value), idUbicacion, txtImagen.Text, DateTime.Today, DateTime.Parse(txtFechaConstruccion.Text)
                    , int.Parse(txtAmbientes.Text), int.Parse(txtBaños.Text), int.Parse(txtCocheras.Text), txtDescripcion.Text, int.Parse(txtValor.Text), int.Parse(ddlVendedorAsignado.Text));
                negocio.Agregar(prop);
                Session.Add("propiedad", prop);
                cargarDropdowns();
                
            }
            catch (Exception ex)
            {
                //Session.Add("error", "Ocurrio un error, por favor intente de nuevo mas tarde");
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }

}