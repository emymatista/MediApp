using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using MedApp.DataModel;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class BuscarMedico : ContentPage
    {
        public BuscarMedico()
        {
            InitializeComponent();
            
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            List<MedicoInfo> myList = new List<MedicoInfo>
            {
                new MedicoInfo{Nombre="Elber Galinda", Consultorio="302", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Alan Perez", Consultorio="512", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Juan Rodriguez", Consultorio="216", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Martin Fernandez", Consultorio="407", ImageUrl="Imagen.png"},
                new MedicoInfo{Nombre="Ana Ceverino", Consultorio="615", ImageUrl="Imagen.png"}
            };
            SearchResultsListView.ItemsSource = myList;
        }
    }
}