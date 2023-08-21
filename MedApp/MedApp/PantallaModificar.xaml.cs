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
        public PantallaModificar(ListarCitas selectedItem)
        {
            InitializeComponent();
            this.selectedItem = selectedItem;

            opEspecialidad = listarEspecialidades();
            pkEspecialidad.ItemsSource = opEspecialidad;
            InitializeUI();
        }

        private void InitializeUI()
        {
            TelefonoPaciente.Text = selectedItem.telefono;
            txtMotivo.Text = selectedItem.motivo;
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
    }
}