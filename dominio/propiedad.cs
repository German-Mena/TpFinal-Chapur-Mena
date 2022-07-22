using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class propiedad
    {
        public int ID { get; set; }
        public tipoPropiedad tipoPropiedad { get; set; }
        public tipoContrato tipoContrato { get; set; }
        public ubicacion ubicacion { get; set; }
        public string link { get; set; } 
        public DateTime fechaPublicacion { get; set; }
        public DateTime fechaConstruccion { get; set; }
        public int cantidadAmbientes { get; set; }
        public int cantidadBaños { get; set; }
        public int cantidadCocheras { get; set; }
        public string descripcion { get; set; }
        public decimal valor { get; set; }
        public int idVendedor { get; set; }

        public int idTipoPropiedad { get; set; }

        public int idTipoContrato { get; set; }

        public int idUbicacion { get; set; }

        public propiedad(int _idTipoPropiedad, int _idTipoContrato, int _idUbicacion, string _link,
            DateTime _fechaPublicacion,DateTime _fechaConstruccion,int _cantidadAmbientes, int _cantidadBaños, int _cantidadCocheras, string _descripcion,
            decimal _valor, int _idVendedor)
        {
            idTipoContrato = _idTipoPropiedad;
            idTipoPropiedad = _idTipoContrato;
            idUbicacion= _idUbicacion;
            link = _link;
            fechaConstruccion = _fechaConstruccion;
            fechaPublicacion = _fechaPublicacion;
            cantidadAmbientes = _cantidadAmbientes;
            cantidadBaños = _cantidadBaños;
            cantidadCocheras = _cantidadCocheras;
            descripcion = _descripcion;
            valor = _valor;
            idVendedor = _idVendedor;
        }
        public propiedad()
        {

        }
    }
}  
