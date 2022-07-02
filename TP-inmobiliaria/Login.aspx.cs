using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_inmobiliaria
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["error"] != null)
            {
                lblMensaje.Text = Session["error"].ToString();
            }
        }

        protected void BtnNuevoUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoUsuario.aspx", false);
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ingresar.aspx", false);
        }
    }
}