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
        public propiedad Propiedad { get; set; }
        public List<multimedia> ListaMultimedia { get; set; }
        //public int idPropiedad { get; set; }
        public List<propiedad> ListaPropiedades { get; set; }
        public List<Favorito> ListaFavoritos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int idPropiedad;
            btnFavorito.Text = "Me interesa";
            int.TryParse(Request.QueryString["idPropiedad"], out idPropiedad);

            propiedadNegocio propiedades = new propiedadNegocio();
            ListaPropiedades = propiedades.listar();
            Propiedad = ListaPropiedades.Find(x => x.ID == idPropiedad);

            multimediaNegocio multimedia = new multimediaNegocio();
            ListaMultimedia = multimedia.listarMultimedia(idPropiedad);

            if (Session["User"] != null)
            {
                Usuario user = (Usuario)Session["User"];
                FavoritoNegocio favorito = new FavoritoNegocio();
                ListaFavoritos = favorito.listarFavoritosPorUsuario(user.ID);
                if (ListaFavoritos.Exists(x => x.IdPropiedad == idPropiedad))
                {
                    Label1.Text = "Ya se encuentra en tus favoritos!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                    btnFavorito.Text = "No me interesa";
                }
            }
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            
            int idPropiedad;
            int.TryParse(Request.QueryString["idPropiedad"], out idPropiedad);
            Session.Add("propiedadFavorita", idPropiedad);

            if (Session["User"] == null)
            {
                Session.Add("error", "Ingresá con tu usuario para mostrar interes en esta propiedad");
                Response.Redirect("Login.aspx",false);
            }
            else
            {
                TxtMsj.Text="";
                Usuario user = (Usuario)Session["User"];
                FavoritoNegocio favorito = new FavoritoNegocio();
                ListaFavoritos = favorito.listarFavoritosPorUsuario(user.ID);

                if (btnFavorito.Text == "No me interesa")
                {
                    favorito.quitar(user.ID, idPropiedad);
                    Label1.Text = "";
                    btnFavorito.Text = "Me interesa";
                }
                else
                {
                    if (!ListaFavoritos.Exists(x => x.IdPropiedad == idPropiedad))
                    {
                        try
                        {
                            
                            favorito.agregar(user.ID, idPropiedad, TxtMsj.Text);
                        }
                        catch (Exception ex)
                        {
                            Session.Add("error", "ocurrio un error, intente nuevamente mas tarde...");
                            Response.Redirect("Error.aspx", false);
                            throw ex;
                        }
                    }

                    Label1.Text = "Ya se encuentra en tus favoritos!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                    btnFavorito.Text = "No me interesa";
                }
                
                //Esto no esta funcionando
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);


            }
        }
    }
}