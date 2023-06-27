using MedApp.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ReservarCita : ContentPage
    {
        public ReservarCita()
        {
            InitializeComponent();
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
    }
}