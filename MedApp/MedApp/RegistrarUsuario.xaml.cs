using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class RegistrarUsuario : ContentPage
    {
        SqlConnection sqlConnection;
        public RegistrarUsuario()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            string srvrdbname = "MediApp";
            string srvrname = "10.0.0.79";
            string srvrusername = "medapp";
            string srvrpassword = "1234";

            string sqlconn = $"Data Source={srvrname};Initial Catalog={srvrdbname}; User ID={srvrusername};Password={srvrpassword}";
            sqlConnection = new SqlConnection(sqlconn);
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            try
            {
                sqlConnection.Open();
                await DisplayAlert("Success", "Conectado", "Ok");
                sqlConnection.Close();
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
            
        }

        private async void Button_Clicked_1(object sender, EventArgs e)
        {
            try
            {
                sqlConnection.Open();
                using (SqlCommand command = new SqlCommand("INSERT INTO dbo.usuario VALUES(@nombre, @apellidos, @codigocli, @descrUsuario," +
                    "@claveUsuario)", sqlConnection))
                {
                    command.Parameters.Add(new SqlParameter("nombre", nombre.Text));
                    command.Parameters.Add(new SqlParameter("apellidos", apellidos.Text));
                    command.Parameters.Add(new SqlParameter("codigocli", codigoUsuario.Text));
                    command.Parameters.Add(new SqlParameter("descrUsuario", descrUsuario.Text));
                    command.Parameters.Add(new SqlParameter("claveUsuario", claveUsuario.Text));
                    command.ExecuteNonQuery();
                }
                sqlConnection.Close();
                await DisplayAlert("Success", "Datos registrados con exito", "Ok");

                nombre.Text = "";
                apellidos.Text = "";
                codigoUsuario.Text = "";
                descrUsuario.Text = "";
                claveUsuario.Text = "";

                await Navigation.PushAsync(new Login());
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }
    }
}