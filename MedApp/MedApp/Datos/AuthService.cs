using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using BCrypt;

namespace MedApp.Datos
{
    public class AuthService
    {
        public async Task<bool> LoginAsync(string username, string password)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;

            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    await con.OpenAsync();

                    using (cmd = new SqlCommand("SELECT claveUsuario FROM usuario WHERE descrUsuario = @descrUsuario", con))
                    {
                        cmd.Parameters.AddWithValue("@descrUsuario", username);
                        var hashedPassword = (string)await cmd.ExecuteScalarAsync();

                        if (hashedPassword != null)
                        {
                            if (password == hashedPassword)
                            {
                                return true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error durante login: " + ex.Message);
                throw;
            }

            return false;
        }
    }
}
