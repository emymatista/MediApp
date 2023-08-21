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
    public partial class PantallaModificar : ContentPage
    {
        private ListarCitas selectedItem;
        private DateTime selectedDate;
        private TimeSpan selectedTime;
        private List<Especialidad> opEspecialidad;
        private List<Medico> opMedico;
        private UpdateManager udManager = new UpdateManager();
        public PantallaModificar(ListarCitas selectedItem)
        {
            InitializeComponent();
            this.selectedItem = selectedItem;

            horaCita.PropertyChanged += OnTimePickerPropertyChanged;

            opEspecialidad = listarEspecialidades();
            pkEspecialidad.ItemsSource = opEspecialidad;
            InitializeUI();
        }

        private void InitializeUI()
        {
            Especialidad especSelec = opEspecialidad.FirstOrDefault(m => m.descripcion == selectedItem.especialidad);
            TelefonoPaciente.Text = selectedItem.telefono;
            txtMotivo.Text = selectedItem.motivo;
            fechaCita.Date = Convert.ToDateTime(selectedItem.fecha);
            pkEspecialidad.SelectedItem = especSelec;
        }

        private void OnTimePickerPropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "Time")
            {
                selectedTime = horaCita.Time;
            }
        }

        private void fechaCita_DateSelected(object sender, DateChangedEventArgs e)
        {
            selectedDate = e.NewDate;
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

        private void pkEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            opMedico = listarMedico();
            pkMedico.ItemsSource = opMedico;
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

        private async void Button_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TelefonoPaciente.Text) || string.IsNullOrEmpty(txtMotivo.Text) || pkMedico.SelectedItem == null ||
                pkEspecialidad.SelectedItem == null)
            {
                await DisplayAlert("Alerta", "Hay datos faltantes", "Ok");
                return;
            }
            else
            {
                Medico medicoSelec = pkMedico.SelectedItem as Medico;
                int idCita = selectedItem.idCita;
                string telefono = TelefonoPaciente.Text;
                string dateString = selectedDate.ToString("yyyy-MM-dd");
                string timeString = selectedTime.ToString("hh\\:ss");
                string motivo = txtMotivo.Text;
                int medicoSelecId = medicoSelec.idMedico;


                bool udResult = udManager.ActualizarCita(idCita, telefono, dateString, timeString, motivo, medicoSelecId);

                if (udResult)
                {
                    await DisplayAlert("Exito", "Datos actualizados con exito", "OK");
                    TelefonoPaciente.Text = "";
                    txtMotivo.Text = "";
                    IdMedico.Text = "";
                    await Navigation.PushAsync(new MenuPrincipalDetail());
                }
                else
                {
                    await DisplayAlert("Error", "Error al actualizar los datos", "OK");
                }
            }
            
        }

        private async void EliminarCita_Clicked(object sender, EventArgs e)
        {
            bool answer = await DisplayAlert("Confirmar", "Estas seguro que quieres cancelar la cita?", "Yes", "No");

            if (answer)
            {
                int idCita = selectedItem.idCita;
                bool cancelar = udManager.EliminarCita(idCita);

                if (cancelar)
                {
                    await DisplayAlert("Exito", "Cita cancelada con exito", "Ok");
                    TelefonoPaciente.Text = "";
                    txtMotivo.Text = "";
                    IdMedico.Text = "";
                    await Navigation.PushAsync(new MenuPrincipalDetail());
                }
                else
                {
                    await DisplayAlert("Error", "Error al cancelar la cita", "Ok");
                }
            }
        }
    }
}