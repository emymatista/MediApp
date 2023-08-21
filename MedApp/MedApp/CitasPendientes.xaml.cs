using MedApp.Datos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class CitasPendientes : ContentPage
    {
        private int userId;
        public CitasPendientes(int loggedInUserId)
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);

            userId = loggedInUserId;

            List<ListarCitas> citas = ListarCitas();
            SearchResultsListView.ItemsSource = citas;
        }

        private List<ListarCitas> ListarCitas()
        {
            List<ListarCitas> citas = new List<ListarCitas>();
            SqlConnection con = null;
            SqlCommand cmd = null;

            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spCitasPendientes", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmIdUsuario", userId);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {

                                citas.Add(new ListarCitas
                                {
                                    fecha = Convert.ToDateTime(reader["fecha"].ToString()).ToString("MM/dd/yyyy"),
                                    hora = reader["hora"].ToString(),
                                    motivo = reader["motivo"].ToString(),
                                    nombre = reader["nombre"].ToString(),
                                    apellidos = reader["apellidos"].ToString(),
                                });

                            }
                        }
                    }
                }

                return citas;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }
    }
}