using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace MedApp.Datos
{
    public class Conexion
    {
        #region "PATRON SINGLETON"
        private static Conexion conexion = null;
        private Conexion() { }
        public static Conexion getInstance()
        {
            if (conexion == null)
            {
                conexion = new Conexion();
            }
            return conexion;
        }
        #endregion

        public SqlConnection ConexionBD()
        {
            string srvrdbname = "MediApp";
            string srvrname = "10.0.0.79";
            string srvrusername = "medapp";
            string srvrpassword = "1234";

            string sqlconn = $"Data Source={srvrname};Initial Catalog={srvrdbname}; User ID={srvrusername};Password={srvrpassword}";
            SqlConnection conexion = new SqlConnection(sqlconn);

            return conexion;
        }
    }
}
