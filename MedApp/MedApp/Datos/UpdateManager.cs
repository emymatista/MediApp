using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace MedApp.Datos
{
    public class UpdateManager
    {
        public bool ActualizarCita(int idCita, string telefono, string fecha, string hora, string motivo, int idMedico)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spActualizarCita", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmidCita", idCita);
                        cmd.Parameters.AddWithValue("@prmTelefono", telefono);
                        cmd.Parameters.AddWithValue("@prmFecha", fecha);
                        cmd.Parameters.AddWithValue("@prmHora", hora);
                        cmd.Parameters.AddWithValue("@prmMotivo", motivo);
                        cmd.Parameters.AddWithValue("@prmIdMedico", idMedico);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al actualizar datos: {ex.Message}");
                return false;
            }
        }

        public bool EliminarCita(int idCita)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spEliminarCita", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmIdCita", idCita);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al eliminar datos: {ex.Message}");
                return false;
            }
        }
    }
}
