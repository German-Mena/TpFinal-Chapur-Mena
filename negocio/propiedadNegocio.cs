using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class propiedadNegocio
    {
        public List<propiedad> listar(bool estado = true)
        {
            List<propiedad> lista = new List<propiedad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(Diccionario.LISTAR_PROPIEDADES);
                datos.ejecutarLectura();
                //datos.ejecutarAccion();

                while (datos.Lector.Read())
                {
                    propiedad aux = new propiedad();
                    aux.ID = (int)datos.Lector["id"];

                    //tipoPropiedad
                    aux.tipoPropiedad = new tipoPropiedad();
                    aux.tipoPropiedad.id = (int)datos.Lector["id"];
                    aux.tipoPropiedad.descripcion = (string)datos.Lector["TipoPropiedad"];
                    //tipoContrato
                    aux.tipoContrato = new tipoContrato();
                    aux.tipoContrato.id = (int)datos.Lector["id"];
                    aux.tipoContrato.descripcion = (string)datos.Lector["TipoContrato"];
                    //ubicación
                    aux.ubicacion = new ubicacion();

                    // con el tema de la ubicacion podemos agregar todo si se quiere
                    aux.ubicacion.ID = (int)datos.Lector["id"];
                    aux.ubicacion.calle = (string)datos.Lector["calle"];
                    aux.ubicacion.altura = (int)datos.Lector["altura"];
                    aux.ubicacion.ciudad = (string)datos.Lector["ciudad"];
                    aux.ubicacion.departamento = (string)datos.Lector["departamento"];
                    aux.ubicacion.pais = (string)datos.Lector["pais"];
                    aux.ubicacion.provincia = (string)datos.Lector["provincia"];

                    aux.fechaPublicacion = (DateTime)datos.Lector["fechaPublicacion"];
                    aux.fechaConstruccion = (DateTime)datos.Lector["fechaConstruccion"];
                    aux.cantidadAmbientes = (int)datos.Lector["cantidadAmbientes"];
                    aux.cantidadBaños = (int)datos.Lector["cantidadBaños"];
                    aux.cantidadCocheras = (int)datos.Lector["cantidadCocheras"];
                    aux.descripcion = (string)datos.Lector["descripcion"];
                    aux.valor = (decimal)datos.Lector["valor"];
                    aux.link = (string)datos.Lector["link"];
                    aux.idVendedor = (int)datos.Lector["idVendedor"];

                    lista.Add(aux);                    
                }
                datos.cerrarConexion();
                return lista;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            //finally
            //{
            //    datos.cerrarConexion();
            //}
        }

        public List<propiedad> listarPropiedades_cards(string idTipoPropiedad = null, string idTipoContrato = null)
        {
            List<propiedad> lista = new List<propiedad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {   
                if (idTipoPropiedad == "" || idTipoPropiedad == null)
                {
                    datos.setearConsulta(Diccionario.LISTAR_PROPIEDADES_CARDS);
                }
                else
                {
                    datos.setearConsulta(Diccionario.LISTAR_PROPIEDADES_CARDS_FILTROS);
                    datos.setearParametro("@idTipoPropiedad", idTipoPropiedad);
                    datos.setearParametro("@idTipoContrato", idTipoContrato);
                }
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    propiedad aux = new propiedad();

                    aux.ID = (int)datos.Lector["id"];
                    aux.link = (string)datos.Lector["link"];
                    aux.descripcion = (string)datos.Lector["descripcion"];
                    aux.valor = (decimal)datos.Lector["valor"];
                    aux.cantidadAmbientes = (int)datos.Lector["cantidadAmbientes"];
                    aux.cantidadBaños = (int)datos.Lector["cantidadBaños"];
                    aux.cantidadCocheras = (int)datos.Lector["cantidadCocheras"];
                    aux.idVendedor = (int)datos.Lector["idVendedor"];
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
        public void Agregar(propiedad prop)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.AGREGAR_PROPIEDAD);
                datos.setearParametro("@idTipoPropiedad", prop.idTipoPropiedad);
                datos.setearParametro("@idTipoContrato", prop.idTipoContrato);
                datos.setearParametro("@idUbicacion", prop.idUbicacion);
                datos.setearParametro("@idVendedor", prop.idVendedor);
                datos.setearParametro("@link", prop.link);
                datos.setearParametro("@fechaPublicacion", prop.fechaPublicacion);
                datos.setearParametro("@fechaConstruccion", prop.fechaConstruccion);
                datos.setearParametro("@cantidadAmbientes", prop.cantidadAmbientes);
                datos.setearParametro("@cantidadBaños", prop.cantidadBaños);
                datos.setearParametro("@cantidadCocheras", prop.cantidadCocheras);
                datos.setearParametro("@descripcion", prop.descripcion);
                datos.setearParametro("@valor", prop.valor);
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