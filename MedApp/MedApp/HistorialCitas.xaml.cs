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
    public partial class HistorialCitas : ContentPage
    {
        public HistorialCitas()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            List<HistorialInfo> myList = new List<HistorialInfo>
            {
                new HistorialInfo{Cita="Cita 1", Fecha="28/6/2023", Hora="08:30"},
                new HistorialInfo{Cita="Cita 2", Fecha="30/6/2023", Hora="09:00"},
                new HistorialInfo{Cita="Cita 3", Fecha="3/7/2023", Hora="08:00"},
                new HistorialInfo{Cita="Cita 4", Fecha="5/7/2023", Hora="08:30"},
                new HistorialInfo{Cita="Cita 5", Fecha="7/7/2023", Hora="08:30"}
            };
            SearchResultsListView.ItemsSource = myList;
        }
    }
}