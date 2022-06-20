using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using System.Data.SqlClient;

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
                    aux.id = (int)datos["id"];
                    //tipoPropiedad
                    aux.tipoPropiedad = new tipoPropiedad();
                    aux.tipoPropiedad.id = (int)datos["idPropiedad"];
                    aux.tipoPropiedad.descripcion = (string)datos["descripcion"];
                    //tipoContrato
                    aux.tipoContrato = new tipoContrato();
                    aux.tipoContrato.id = (int)datos["idContrato"];
                    aux.tipoContrato.descripcion = (string)datos["descripcion"];
                    //ubicación
                    aux.ubicacion = new ubicacion();
                    // con el tema de la ubicacion podemos agregar todo si se quiere
                    aux.ubicacion.id = datos["idUbicacion"];
                    aux.ubicacion.calle = datos["calle"];
                    // fechas, es correcto?
                    aux.fechaPublicacion = datos["fechaPublicacion"];
                    aux.fechaConstruccion = datos["fechaConstruccion"];
                    aux.cantidadAmbientes =(int)datos["cantidadAmbientes"];
                    aux.cantidadCocheras = (int)datos["cantidadCocheras"];
                    aux.descripcion = (string)datos["descripcion"];
                    aux.valor = (decimal)datos["valor"];
                    //multimedia
                    aux.multimedia = new multimedia();
                    aux.multimedia.id = (int)datos["idMultimedia"];
                    if (!(datos["link"] is DBNull))
                        aux.multimedia.link = (string)datos["link"];
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
