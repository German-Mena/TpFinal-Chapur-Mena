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
                datos.ejecutarAccion();

                while (datos.Lector.Read())
                {
                    propiedad aux = new propiedad();
                    aux.ID = (int)datos.Lector["id"];
                    //tipoPropiedad
                    aux.tipoPropiedad = new tipoPropiedad();
                    aux.tipoPropiedad.id = (int)datos.Lector["idPropiedad"];
                    aux.tipoPropiedad.descripcion = (string)datos.Lector["descripcion"];
                    //tipoContrato
                    aux.tipoContrato = new tipoContrato();
                    aux.tipoContrato.id = (int)datos.Lector["idContrato"];
                    aux.tipoContrato.descripcion = (string)datos.Lector["descripcion"];
                    //ubicación
                    aux.ubicacion = new ubicacion();
                    // con el tema de la ubicacion podemos agregar todo si se quiere
                    aux.ubicacion.ID = (int)datos.Lector["idUbicacion"];
                    aux.ubicacion.calle = (string)datos.Lector["calle"];
                    // fechas, es correcto?
                    aux.fechaPublicacion = (DateTime)datos.Lector["fechaPublicacion"];
                    aux.fechaConstruccion = (DateTime)datos.Lector["fechaConstruccion"];
                    aux.cantidadAmbientes =(int)datos.Lector["cantidadAmbientes"];
                    aux.cantidadCocheras = (int)datos.Lector["cantidadCocheras"];
                    aux.descripcion = (string)datos.Lector["descripcion"];
                    aux.valor = (decimal)datos.Lector["valor"];
                    //multimedia
                    aux.multimedia = new multimedia();
                    aux.multimedia.ID = (int)datos.Lector["idMultimedia"];
                    if (!(datos.Lector["link"] is DBNull))
                        aux.multimedia.link = (string)datos.Lector["link"];
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
