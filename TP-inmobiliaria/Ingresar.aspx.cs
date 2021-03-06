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
    public partial class Ingresar : System.Web.UI.Page
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
                usuario = new Usuario(txtUser.Text, txtPass.Text);

                if(negocio.Loguear(usuario))
                {
                    Session.Add("User", usuario);
                    //Mostrar modal de ingreso correcto

                    //Aca deberia buscar el id del TipoUsuario vendedor en la tabla tipoUsuario
                    if((int)usuario.TipoUsuario == 2)
                    {
                        Response.Redirect("Interesados.aspx", false);
                    }
                    else
                    {
                        if (Session["propiedadFavorita"] == null)
                        {
                            Response.Redirect("HomePage.aspx", false);
                        }
                        else
                        {
                            int idPropiedad = (int)Session["propiedadFavorita"];
                            string ruta = "DetallePropiedad.aspx?idPropiedad=" + idPropiedad;
                            Response.Redirect(ruta, false);
                        }
                    }

                }
                else
                {
                    Session.Add("error", "Nombre de usuario o contraseña incorrectos");
                    Response.Redirect("Error.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}