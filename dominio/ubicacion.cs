﻿using System;
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
    }
}
