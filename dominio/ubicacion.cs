using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class ubicacion
    {
        public int ID { get; set; }
        public string calle { get; set; }
        public int altura { get; set; }
        public string departamento { get; set; }
        public string ciudad { get; set; }
        public string provincia { get; set; }
        public string pais { get; set; }

        public ubicacion(string _calle, int _altura, string _departamento, string _ciudad, string _provincia, string _pais)
        {
            calle = _calle;
            altura = _altura;
            departamento = _departamento;
            ciudad = _ciudad;
            provincia = _provincia;
            pais = _pais;   
        }
        public ubicacion()
        {

        }
    }
   
}
