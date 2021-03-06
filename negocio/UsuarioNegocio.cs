using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.setearConsulta(Diccionario.LISTAR_USUARIOS);
                datos.setearParametro("@user", usuario.User);
                datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.ID = (int)datos.Lector["id"];


                    switch ((int)datos.Lector["tipoUser"])
                    {
                        case 1: 
                            usuario.TipoUsuario = TipoUsuario.COMPRADOR;
                            break;
                        case 2:
                            usuario.TipoUsuario = TipoUsuario.VENDEDOR;
                            break;
                        case 3:
                            usuario.TipoUsuario = TipoUsuario.ADMIN;
                            break;
                    }

                    usuario.Mail = (string)datos.Lector["mail"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.Telefono = (long)datos.Lector["Telefono"];

                    return true;
                }

                return false;
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

        public void Agregar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(Diccionario.AGREGAR_USUARIO);
                datos.setearParametro("@user", usuario.User);
                datos.setearParametro("@pass", usuario.Pass);
                datos.setearParametro("@tipoUsuario", usuario.TipoUsuario);
                datos.setearParametro("@mail", usuario.Mail);
                datos.setearParametro("@nombre", usuario.Nombre);
                datos.setearParametro("@apellido", usuario.Apellido);
                datos.setearParametro("@telefono", usuario.Telefono);

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

        public Usuario buscarUsuario(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Usuario usuario = new Usuario();
            
            try
            {
                datos.setearConsulta(Diccionario.BUSCAR_DATOS_USUARIO);
                datos.setearParametro("@IdUsuario", id);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.ID = (int)datos.Lector["ID"];
                    usuario.Mail = (string)datos.Lector["mail"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.Telefono = (long)datos.Lector["Telefono"];

                    return usuario;
                }

                usuario.ID = -1;
                return usuario;
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

        public List<Usuario> listarVendedores()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta(Diccionario.LISTAR_VENDEDORES);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.ID = (int)datos.Lector["ID"];
                    aux.User = (string)datos.Lector["Usuario"];
                    aux.Pass = (string)datos.Lector["Pass"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Telefono = (long)datos.Lector["Telefono"];
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
