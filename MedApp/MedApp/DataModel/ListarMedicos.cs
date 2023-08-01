using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Numerics;
using System.Text;
using MedApp.Datos;

namespace MedApp.DataModel
{
    public class ListarMedicos
    {
        private readonly string conexion;
        public ListarMedicos(string conexion)
        {
            this.conexion = conexion;
        }

        public List<Medico> GetDoctors()
        {
            List<Medico> doctors = new List<Medico>();

            using (SqlConnection connection = new SqlConnection(conexion))
            {
                using (SqlCommand command = new SqlCommand("spListarMedicos", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            doctors.Add(new Medico
                            {
                                idMedico = Convert.ToInt32(reader["idMedico"]),
                                nombre = reader["nombre"].ToString(),
                                apellidos = reader["apellidos"].ToString()
                            });
                        }
                    }
                }
            }

            return doctors;
        }
    }
}
