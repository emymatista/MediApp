using MedApp.DataModel;
using MedApp.Datos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.PlatformConfiguration.iOSSpecific;
using Xamarin.Forms.Xaml;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ReservarCita : ContentPage
    {
        private DateTime selectedDate;
        private TimeSpan selectedTime;
        private ListarEspecialidad listaEspecialidad;
        private ListarMedicos listaMedicos;
        public ReservarCita()
        {
            InitializeComponent();
            horaCita.PropertyChanged += OnTimePickerPropertyChanged;
            string conexion = $"Data Source=10.0.0.79;Initial Catalog=MediApp; User ID=medapp;Password=1234";
            listaEspecialidad = new ListarEspecialidad(conexion);
            listaMedicos = new ListarMedicos(conexion);

            CargarEspecialidad();
            CargarMedicos();
        }

        private void CargarEspecialidad()
        {
            List<string> especialidad = listaEspecialidad.GetEspecialidad();
            pkEspecialidad.ItemsSource = especialidad;
        }

        private void CargarMedicos()
        {
            List<Medico> doctors = listaMedicos.GetDoctors();
            pkMedico.ItemsSource = doctors;
        }
        private void OnTimePickerPropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "Time")
            {
                selectedTime = horaCita.Time;
            }
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            /*
            SearchResultsListView.IsVisible = true;

            List<HorarioMedico> myList = new List<HorarioMedico>
            {
                new HorarioMedico{Nombre="Alan Brito", Hora="08:30", consultorio="512"},
                new HorarioMedico{Nombre="Alan Brito", Hora="10:00", consultorio="512"},
                new HorarioMedico{Nombre="Alan Brito", Hora="14:00", consultorio="512"},
                new HorarioMedico{Nombre="Alan Brito", Hora="15:30", consultorio="512"},
            };
            SearchResultsListView.ItemsSource = myList;
            */         
        }

        private async void Button_Clicked_1(object sender, EventArgs e)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            Medico medicoSelec = pkMedico.SelectedItem as Medico;
            string dateString = selectedDate.ToString("yyyy-MM-dd");
            string timeString = selectedTime.ToString();
            int medicoSelecId = medicoSelec.idMedico;
            using (con = Conexion.getInstance().ConexionBD())
            {
                using (cmd = new SqlCommand("spRegistrarCita", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@prmTelefono", TelefonoPaciente.Text);
                    cmd.Parameters.AddWithValue("@prmFecha", dateString);
                    cmd.Parameters.AddWithValue("@prmHora", timeString);
                    cmd.Parameters.AddWithValue("@prmMotivo", txtMotivo.Text);
                    cmd.Parameters.AddWithValue("@prmIdMedico", medicoSelecId);
                    cmd.Parameters.AddWithValue("@prmIdUsuario", Convert.ToInt32(IdUsuario.Text));

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
                        await DisplayAlert("Exito", "Cita registrada con exito", "Ok");

                        TelefonoPaciente.Text = "";
                        txtMotivo.Text = "";
                        IdMedico.Text = "";
                        IdUsuario.Text = "";
                        await Navigation.PushAsync(new MenuPrincipalDetail());
                    }
                }
            }
        }

        private void fechaCita_DateSelected(object sender, DateChangedEventArgs e)
        {
            selectedDate = e.NewDate;
        }
    }
}