using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using MedApp.Datos;
using System.Data.SqlClient;
using System.Data;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class BuscarMedico : ContentPage
    {
        private int userId;
        private List<Especialidad> opEspecialidad;
        public BuscarMedico(int loggedInUserId)
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);

            opEspecialidad = listarEspecialidades();
            pkEspecialidad.ItemsSource = opEspecialidad;

            userId = loggedInUserId;
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            if (pkEspecialidad.SelectedItem == null)
            {
                List<InfoMedico> info = DatosDatabaseTodos();
                SearchResultsListView.ItemsSource = info;
            }
            else
            {
                List<InfoMedico> info = DatosDatabase();
                SearchResultsListView.ItemsSource = info;

            }
            /*
            List<MedicoInfo> myList = new List<MedicoInfo>
            {
                new MedicoInfo{Nombre="Elber Galinda", Consultorio="302", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Alan Perez", Consultorio="512", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Juan Rodriguez", Consultorio="216", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Martin Fernandez", Consultorio="407", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Ana Ceverino", Consultorio="615", ImageUrl="Imagen.png"}
            };
            SearchResultsListView.ItemsSource = myList;
            */
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

        private List<InfoMedico> DatosDatabase()
        {
            List<InfoMedico> info = new List<InfoMedico>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            Especialidad especSelec = pkEspecialidad.SelectedItem as Especialidad;
            int especSelecId = especSelec.idEspecialidad;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    using (cmd = new SqlCommand("spInfoMedicos", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@prmIdEspecialidad", especSelecId);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                info.Add(new InfoMedico
                                {
                                    nombre = reader["nombre"].ToString(),
                                    apellidos = reader["apellidos"].ToString(),
                                    especialidad = reader["especialidad"].ToString(),
                                    consultorio = reader["consultorio"].ToString()
                                });
                            }
                        }
                    }
                }

                return info;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }

        private List<InfoMedico> DatosDatabaseTodos()
        {
            List<InfoMedico> info = new List<InfoMedico>();
            SqlConnection con = null;
            SqlCommand cmd = null;
            try
            {
                using (con = Conexion.getInstance().ConexionBD())
                {
                    con.Open();

                    using (cmd = new SqlCommand("spInfoMedicosTodos", con))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                info.Add(new InfoMedico
                                {
                                    nombre = reader["nombre"].ToString(),
                                    apellidos = reader["apellidos"].ToString(),
                                    especialidad = reader["especialidad"].ToString(),
                                    consultorio = reader["consultorio"].ToString()
                                });
                            }
                        }
                    }
                }

                return info;
            }
            catch (Exception ex)
            {
                DisplayAlert("Error", ex.Message, "Ok");
                throw;
            }
        }
    }
}