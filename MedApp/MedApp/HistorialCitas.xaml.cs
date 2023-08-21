using MedApp.DataModel;
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
    public partial class HistorialCitas : ContentPage
    {
        private int userId;
        public HistorialCitas(int loggedInUserId)
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            /*
            List<HistorialInfo> myList = new List<HistorialInfo>
            {
                new HistorialInfo{Cita="Cita 1", Fecha="28/6/2023", Hora="08:30"},
                new HistorialInfo{Cita="Cita 2", Fecha="30/6/2023", Hora="09:00"},
                new HistorialInfo{Cita="Cita 3", Fecha="3/7/2023", Hora="08:00"},
                new HistorialInfo{Cita="Cita 4", Fecha="5/7/2023", Hora="08:30"},
                new HistorialInfo{Cita="Cita 5", Fecha="7/7/2023", Hora="08:30"}
            };
            SearchResultsListView.ItemsSource = myList;
            */

            userId = loggedInUserId;

            List<Historial> historial = ListarHistorial();
            SearchResultsListView.ItemsSource = historial;
        }

        private List<Historial> ListarHistorial()
        {
            List<Historial> historial = new List<Historial>();
            SqlConnection con = null;
            SqlCommand cmd = null;

            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spHistorial", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmIdUsuario", userId);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {

                                historial.Add(new Historial
                                {
                                    fecha = Convert.ToDateTime(reader["fecha"].ToString()).ToString("MM/dd/yyyy"),
                                    hora = reader["hora"].ToString(),
                                    nombre = reader["nombre"].ToString(),
                                    apellidos = reader["apellidos"].ToString(),
                                });

                            }
                        }
                    }
                }

                return historial;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }
    }
}