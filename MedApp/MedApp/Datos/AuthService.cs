using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace MedApp.Datos
{
    public class AuthService
    {
        private Usuario loggedInUser;

        public async Task<Usuario> LoginAsync(string username, string password)
        {
            int userId = await GetUserIdFromDatabase(username, password);

            if (userId != 0)
            {
                loggedInUser = new Usuario
                {
                    idUsuario = userId,
                    usuario = username,
                    password = password
                };

                return loggedInUser;
            }

            return null;
        }

        private async Task<int> GetUserIdFromDatabase(string username, string password)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    await con.OpenAsync();

                    string query = "SELECT idUsuario FROM usuario WHERE descrUsuario = @descrUsuario AND claveUsuario = @claveUsuario";

                    using (cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@descrUsuario", username);
                        cmd.Parameters.AddWithValue("@claveUsuario", password);

                        int userID = (int)cmd.ExecuteScalar();

                        return userID;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
