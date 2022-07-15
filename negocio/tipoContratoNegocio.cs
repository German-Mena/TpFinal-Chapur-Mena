using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class tipoContratoNegocio
    {
        public List<tipoContrato> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<tipoContrato> lista = new List<tipoContrato>();
            try
            {

                datos.setearConsulta(Diccionario.LISTAR_TIPOS_CONTRATOS);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    tipoContrato aux = new tipoContrato();
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