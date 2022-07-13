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

        public static string LISTAR_PROPIEDADES = "select P.id, P.descripcion, TC.descripcion TipoContrato, U.calle,U.altura, U.ciudad, U.departamento, U.pais, U.provincia, P.fechaPublicacion, P.fechaConstruccion" +
                                                  ",P.cantidadAmbientes, P.cantidadBaños,P.cantidadCocheras, TP.descripcion TipoPropiedad, P.link, P.valor, P.idVendedor from propiedad P, tipoPropiedad TP, ubicacion U, " +
                                                  " tipoContrato TC where P.idTipoPropiedad = TP.id and  P.idUbicacion = U.id and P.idTipoContrato = TC.id";

        public static string LISTAR_PROPIEDADES_CARDS = "select P.id, P.link, P.descripcion, P.valor, P.cantidadAmbientes, P.cantidadBaños, P.cantidadCocheras, P.idVendedor from propiedad P";

        public static string LISTAR_MULTIMEDIA = "select id, descripcion, idPropiedad, link from multimedia where idPropiedad = @idPropiedad";

        public static string LISTAR_USUARIOS = "select ID, Usuario, Pass, TipoUser, Mail, Nombre, Apellido, Telefono from Usuario where Usuario = @user AND Pass = @pass";

        public static string BUSCAR_DATOS_USUARIO = "select ID, Mail, Nombre, Apellido, Telefono from Usuario where ID = @IdUsuario";

        public static string AGREGAR_USUARIO = "insert into usuario values (@user, @pass, @tipoUsuario, @mail, @nombre, @apellido, @telefono)";

        public static string LISTAR_FAVORITOS_POR_USUARIO = "select ID, IdUsuario, IdPropiedad, Mensaje, Estado from favorito where IdUsuario = @IdUsuario";

        public static string AGREGAR_FAVORITO = "insert into favorito values (@idUsuario, @idPropiedad,@mensaje,@estado)";

        public static string QUITAR_FAVORITO = "delete from favorito where IdUsuario=@idUsuario AND IdPropiedad=@idPropiedad";

        public static string LISTAR_FAVORITOS = "select ID, IdUsuario, IdPropiedad, Mensaje, Estado from favorito";

        public static string UPDATE_FAVORITOS = "update favorito set Estado = 0 where IdUsuario=@idUsuario and IdPropiedad=@idPropiedad";

    }
}