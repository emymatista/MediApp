using System;
using System.Collections.Generic;
using System.Text;

namespace MedApp.Datos
{
    public class Especialidad
    {
        public int idEspecialidad { get; set; }
        public string descripcion { get; set; }

        public override string ToString()
        {
            return descripcion;
        }
    }
}
