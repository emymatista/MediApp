using MedApp.Datos;
using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace MedApp.DataModel
{
    public class ListarEspecialidad
    {
        private readonly string conexion;
        
        public ListarEspecialidad(string conexion)
        {
            this.conexion = conexion;
        }
        

        public List<String> GetEspecialidad()
        {
            List<String> especialidad = new List<String>();
            using (SqlConnection con = new SqlConnection(conexion))
            {
                string query = "SELECT descripcion FROM especialidad";

                using (SqlCommand command = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            especialidad.Add(reader["descripcion"].ToString());
                        }
                    }
                }
            }
            return especialidad;
        }
    }
}
