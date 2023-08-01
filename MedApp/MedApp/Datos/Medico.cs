using System;
using System.Collections.Generic;
using System.Text;

namespace MedApp.Datos
{
    public class Medico
    {
        public int idMedico { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }

        public override string ToString()
        {
            return $"{nombre} {apellidos}";
        }
    }
}
