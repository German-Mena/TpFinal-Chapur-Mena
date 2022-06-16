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

        public static string LISTAR_PROPIEDADES = "Select ID, P.descripcion, C.descripcion, u.calle, fechaPublicacion, fechaConstruccion," +
                                                  "cantidadAmbientes, cantidadBaños, cantidadCocheras, descripcion, valor, M.link from propiedad , multimedia M Where propiedad.ID = M.idPropiedad" +
                                                  " and propiedad.ID = P.idPropiedad and  propiedad.ID = C.idPropiedad and propiedad.ID = U.idPropiedad";
        //Pendiente a desarrollar
    }
}