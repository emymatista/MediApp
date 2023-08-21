using System;
using System.Collections.Generic;
using System.Text;

namespace MedApp.Datos
{
    public class TipoUsuario
    {
        public int idTipoUsuario { get; set; }
        public string descripcion { get; set; }

        public override string ToString()
        {
            return descripcion;
        }
    }
}
