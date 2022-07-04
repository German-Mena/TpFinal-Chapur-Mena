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
    public partial class NuevoUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                long telefono;
                long.TryParse(txtTelefono.Text, out telefono);

                usuario = new Usuario(txtUser.Text, txtPass.Text, 1,txtMail.Text, txtNombre.Text, txtApellido.Text, telefono);
                negocio.Agregar(usuario);
                Session.Add("usuario", usuario);
            }
            catch (Exception ex)
            {
                Session.Add("error", "Ocurrio un error, por favor intente de nuevo mas tarde");
                //Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}