using MedApp.DataModel;
using MedApp.Datos;
using System;
using System.Collections.Generic;
using System.Data;
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
        private List<Especialidad> opEspecialidad;
        private List<Medico> opMedico;
        private int userId;
        public ReservarCita(int loggedInUserId)
        {
            InitializeComponent();
            horaCita.PropertyChanged += OnTimePickerPropertyChanged;
            
            opEspecialidad = listarEspecialidades();
            pkEspecialidad.ItemsSource = opEspecialidad;

            userId = loggedInUserId;

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
                    cmd.Parameters.AddWithValue("@prmIdUsuario", userId);

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
                        await Navigation.PushAsync(new MenuPrincipalDetail());
                    }
                }
            }
        }
        
        private void fechaCita_DateSelected(object sender, DateChangedEventArgs e)
        {
            selectedDate = e.NewDate;
        }

        private void pkEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            opMedico = listarMedico();
            pkMedico.ItemsSource = opMedico;
        }

        private List<Especialidad> listarEspecialidades() 
        {
            List<Especialidad> especialidad = new List<Especialidad>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spListarEspecialidades", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                especialidad.Add(new Especialidad
                                {
                                    idEspecialidad = Convert.ToInt32(reader["idEspecialidad"]),
                                    descripcion = reader["descripcion"].ToString()
                                });
                            }
                        }
                    }
                }

                return especialidad;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }

        private List<Medico> listarMedico()
        {
            List<Medico> medicos = new List<Medico>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            Especialidad especSelec = pkEspecialidad.SelectedItem as Especialidad;
            int especSelecId = especSelec.idEspecialidad;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spListarMedicosDef", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmIdEspecialidad", especSelecId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                medicos.Add(new Medico
                                {
                                    idMedico = Convert.ToInt32(reader["idMedico"]),
                                    nombre = reader["nombre"].ToString(),
                                    apellidos = reader["apellidos"].ToString()
                                });
                            }
                        }
                    }
                }

                return medicos;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }
    }
}