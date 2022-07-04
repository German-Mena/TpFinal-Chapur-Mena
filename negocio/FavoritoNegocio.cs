using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class FavoritoNegocio
    {
        public List<Favorito> listarFavoritos(int idUsuario)
        {
            List<Favorito> lista = new List<Favorito>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.LISTAR_FAVORITOS);
                datos.setearParametro("@IdUsuario", idUsuario);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Favorito aux = new Favorito();

                    aux.ID = (int)datos.Lector["id"];
                    aux.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.IdPropiedad = (int)datos.Lector["IdPropiedad"];

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

        public void agregar(int idUsuario, int idPropiedad)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.AGREGAR_FAVORITO);
                datos.setearParametro("@idUsuario", idUsuario);
                datos.setearParametro("@idPropiedad", idPropiedad);

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
