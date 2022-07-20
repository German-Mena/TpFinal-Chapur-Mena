using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class multimediaNegocio
    {
        public List<multimedia> listarMultimedia(int idPropiedad)
        {
            List<multimedia> lista = new List<multimedia>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.LISTAR_MULTIMEDIA);
                datos.setearParametro("@idPropiedad", idPropiedad);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    multimedia aux = new multimedia();

                    aux.ID = (int)datos.Lector["id"];
                    aux.propiedad = new propiedad();
                    aux.propiedad.ID = (int)datos.Lector["idPropiedad"];
                    aux.link = (string)datos.Lector["link"];
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

        public void Agregar(multimedia multi)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(Diccionario.AGREGAR_MULTIMEDIA);
                datos.setearParametro("@descripcion", multi.descripcion);
                datos.setearParametro("@idPropiedad", multi.propiedad.ID);
                datos.setearParametro("@link", multi.link);
                datos.ejecutarAccion();
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
