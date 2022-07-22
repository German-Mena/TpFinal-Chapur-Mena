using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class ubicacionNegocio
    {
        public int BuscarID(string calle, string altura)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.LISTAR_UBICACION);
                datos.setearParametro("@calle", calle);
                datos.setearParametro("@altura", altura);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int id = (int)datos.Lector["id"];
                    return id;
                }

                return 0;
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
        public void Agregar(ubicacion ubic)
            {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.AGREGAR_UBICACION);
                datos.setearParametro("@calle", ubic.calle);
                datos.setearParametro("@altura", ubic.altura);
                datos.setearParametro("@departamento", ubic.departamento);
                datos.setearParametro("@ciudad", ubic.ciudad);
                datos.setearParametro("@provincia", ubic.provincia);
                datos.setearParametro("@pais", ubic.pais);
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
