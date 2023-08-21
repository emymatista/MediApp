using MedApp.Datos;
using System;
using System.Collections.Generic;
using System.Data;
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
        private List<TipoUsuario> opTipoUsuario;
        public RegistrarUsuario()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);

            opTipoUsuario = listarTipoUsuario();
            pkTipoUsuario.ItemsSource = opTipoUsuario;
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
            string input1 = nombre.Text;
            string input2 = apellidos.Text;
            string input3 = codigoUsuario.Text;
            string input4 = descrUsuario.Text;
            string input5 = claveUsuario.Text;

            if (string.IsNullOrEmpty(input1) || string.IsNullOrEmpty(input2) || pkTipoUsuario.SelectedItem == null ||
                string.IsNullOrEmpty(input3) || string.IsNullOrEmpty(input4) || string.IsNullOrEmpty(input5))
            {
                await DisplayAlert("Alerta", "Hay datos faltantes", "Ok");
                return;
            }
            else
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                TipoUsuario tipoSelec = pkTipoUsuario.SelectedItem as TipoUsuario;
                int tipoSelecId = tipoSelec.idTipoUsuario;

                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spRegistrarUsuario", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmNombre", nombre.Text);
                        cmd.Parameters.AddWithValue("@prmApellidos", apellidos.Text);
                        cmd.Parameters.AddWithValue("@prmidTipoUsuario", tipoSelecId);
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

        private List<TipoUsuario> listarTipoUsuario()
        {
            List<TipoUsuario> tipoUsuario = new List<TipoUsuario>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spListarTipoUsuario", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                tipoUsuario.Add(new TipoUsuario
                                {
                                    idTipoUsuario = Convert.ToInt32(reader["idTipoUsuario"]),
                                    descripcion = reader["descripcion"].ToString()
                                });
                            }
                        }
                    }
                }

                return tipoUsuario;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }
    }
}