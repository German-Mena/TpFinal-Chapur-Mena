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
        public List<Favorito> listarFavoritosPorUsuario(int idUsuario)
        {
            List<Favorito> lista = new List<Favorito>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.LISTAR_FAVORITOS_POR_USUARIO);
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

        public List<Favorito> listarFavoritos()
        {
            List<Favorito> lista = new List<Favorito>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.LISTAR_FAVORITOS);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Favorito aux = new Favorito();

                    aux.ID = (int)datos.Lector["id"];
                    aux.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.IdPropiedad = (int)datos.Lector["IdPropiedad"];
                    aux.Mensaje = (string)datos.Lector["Mensaje"];
                    aux.Estado = (bool)datos.Lector["Estado"];

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
        public void setearEstado(int idUsuario, int idPropiedad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(Diccionario.UPDATE_FAVORITOS);
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
        public void agregar(int idUsuario, int idPropiedad, string text)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.AGREGAR_FAVORITO);
                datos.setearParametro("@idUsuario", idUsuario);
                datos.setearParametro("@idPropiedad", idPropiedad);
                datos.setearParametro("@mensaje", text);
                datos.setearParametro("@estado", 1);

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
        public void quitar(int idUsuario, int idPropiedad)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.QUITAR_FAVORITO);
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
