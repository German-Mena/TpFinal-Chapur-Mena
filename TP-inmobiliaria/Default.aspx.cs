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
    public partial class Default : System.Web.UI.Page
    {
        private List<propiedad> listaPropiedades;

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar();
        }

        private void cargar()
        {
            propiedadNegocio propiedad = new propiedadNegocio();
            try
            {
                listaPropiedades = propiedad.listar();
                dgvTable.DataSource = listaPropiedades;
                //cargarImagen(listaPropiedades[0].link);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void cargarImagen(string imagen)
        {
            try
            {
                pbxImage.Load(imagen);
            }
            catch (Exception)
            {
                pbxImage.Load("https://efectocolibri.com/wp-content/uploads/2021/01/placeholder.png");
            }
        }


    }
}