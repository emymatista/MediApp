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
        private readonly string connectionString = $"Data Source=10.0.0.79;Initial Catalog=MediApp; User ID=medapp;Password=1234";

        public async Task<bool> LoginAsync(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    await connection.OpenAsync();

                    using (SqlCommand command = new SqlCommand("SELECT claveUsuario FROM usuario WHERE descrUsuario = @descrUsuario", connection))
                    {
                        command.Parameters.AddWithValue("@descrUsuario", username);
                        var hashedPassword = (string)await command.ExecuteScalarAsync();

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
