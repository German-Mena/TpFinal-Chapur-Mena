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

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtUser.Text, txtPass.Text);

                if (negocio.Loguear(usuario))
                {
                    Session.Add("User", usuario);
                    //Mostrar modal de ingreso correcto

                    //Aca deberia buscar el id del TipoUsuario vendedor en la tabla tipoUsuario
                    if ((int)usuario.TipoUsuario == 2)
                    {
                        Response.Redirect("Interesados.aspx", false);
                    }
                    else
                    {
                        redireccionar();
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

        protected void btn_nuevoUser_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                long telefono;
                long.TryParse(txtTelefono.Text, out telefono);

                usuario = new Usuario(txtUserNuevo.Text, txtPassNuevo.Text, 1, txtMail.Text, txtNombre.Text, txtApellido.Text, telefono);
                negocio.Agregar(usuario);
                Session.Add("User", usuario);
                redireccionar();
            }
            catch (Exception ex)
            {
                Session.Add("error", "Ocurrio un error, por favor intente de nuevo mas tarde");
                //Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        private void redireccionar()
        {
            if (Session["propiedadFavorita"] == null)
            {
                Response.Redirect("HomePage.aspx", false);
            }
            else
            {
                int idPropiedad = (int)Session["propiedadFavorita"];
                string ruta = "DetallePropiedad.aspx?idPropiedad=" + idPropiedad;
                agregarFavorito();
                Response.Redirect(ruta, false);
            }
        }

        private void agregarFavorito()
        {
            Usuario user = (Usuario)Session["User"];
            FavoritoNegocio favorito = new FavoritoNegocio();
            List<Favorito> ListaFavoritos = favorito.listarFavoritosPorUsuario(user.ID);

            int propiedadFavorita = (int)Session["propiedadFavorita"];

            if (!ListaFavoritos.Exists(x => x.IdPropiedad == propiedadFavorita))
            {
                try
                {
                    favorito.agregar(user.ID, propiedadFavorita);
                }
                catch (Exception ex)
                {
                    Session.Add("error", "ocurrio un error, intente nuevamente mas tarde...");
                    Response.Redirect("Error.aspx", false);
                    throw ex;
                }
            }
        }

    }
}