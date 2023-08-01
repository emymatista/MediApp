using MedApp.Datos;
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
        public RegistrarUsuario()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                con = Conexion.getInstance().ConexionBD();
                con.Open();
                await DisplayAlert("Success", "Conectado", "Ok");
                con.Close();
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
            
        }

        private async void Button_Clicked_1(object sender, EventArgs e)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            using (con = Conexion.getInstance().ConexionBD()) 
            {
                using (cmd = new SqlCommand("spRegistrarUsuario", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@prmNombre", nombre.Text);
                    cmd.Parameters.AddWithValue("@prmApellidos", apellidos.Text);
                    cmd.Parameters.AddWithValue("@prmCodigoCli", codigoUsuario.Text);
                    cmd.Parameters.AddWithValue("@prmDescrUsuario", descrUsuario.Text);
                    cmd.Parameters.AddWithValue("@prmClaveUsuario", claveUsuario.Text);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        await DisplayAlert("Error", ex.Message, "Ok");
                        throw;
                    }
                    finally 
                    {
                        con.Close();
                        await DisplayAlert("Success", "Datos registrados con exito", "Ok");

                        nombre.Text = "";
                        apellidos.Text = "";
                        codigoUsuario.Text = "";
                        descrUsuario.Text = "";
                        claveUsuario.Text = "";

                        await Navigation.PushAsync(new Login());
                    }
                }
            }
        }
    }
}