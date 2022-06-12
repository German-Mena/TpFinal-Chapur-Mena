using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    class propiedad
    {
        public int ID { get; set; }
        public tipoPropiedad tipoPropiedad { get; set; }
        public tipoContrato tipoContrato { get; set; }
        public direccion direccion { get; set; }
        public DateTime fechaPublicacion { get; set; }
        public DateTime fechaConstruccion { get; set; }
        public int cantidadAmbientes { get; set; }
        public int cantidadBaños { get; set; }
        public int cantidadCocheras { get; set; }
        public string descripcion { get; set; }
        public decimal valor { get; set; }
    }
}
