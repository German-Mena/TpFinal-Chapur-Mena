using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class tipoPropiedadNegocio
    {
        public List<tipoPropiedad> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<tipoPropiedad> lista = new List<tipoPropiedad>();
            try
            {

                datos.setearConsulta(Diccionario.LISTAR_TIPOS_PROPIEDADES);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    tipoPropiedad aux = new tipoPropiedad();
                    aux.id = (int)datos.Lector["id"];
                    aux.descripcion = (string)datos.Lector["descripcion"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}