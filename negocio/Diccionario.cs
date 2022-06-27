using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    class Diccionario
    {
        public static string CONEXION_SERVER = "server =.\\SQLEXPRESS; database=inmobiliaria_DB; integrated security = true";

        public static string LISTAR_PROPIEDADES = "Select P.id, P.descripcion, TC.descripcion TipoContrato, U.calle, P.fechaPublicacion, P.fechaConstruccion,P.cantidadAmbientes , P.cantidadBaños," +
                                                  "P.cantidadCocheras, TP.descripcion TipoPropiedad, P.valor, M.link from propiedad P, multimedia M, tipoPropiedad TP, ubicacion U, tipoContrato TC " +
                                                  "where P.idMultimedia = M.id and P.idTipoPropiedad = TP.id and  P.idUbicacion = U.id and P.idTipoContrato = TC.id";

        public static string LISTAR_PROPIEDADES_CARDS = "select P.id, P.link, P.descripcion, P.valor, P.cantidadAmbientes, P.cantidadBaños, P.cantidadCocheras from propiedad P";

        public static string LISTAR_MULTIMEDIA = "select id, descripcion, idPropiedad, link from multimedia where idPropiedad = @idPropiedad";
    }
}