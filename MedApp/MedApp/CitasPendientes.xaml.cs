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
    public partial class CitasPendientes : ContentPage
    {
        private int userId;
        public CitasPendientes(int loggedInUserId)
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            List<CitaInfo> myList = new List<CitaInfo>
            {
                new CitaInfo{Cita="Cita 1", Hora="08:30", Fecha="28/6/2023"},
                new CitaInfo{Cita="Cita 2", Hora="09:00", Fecha="30/6/2023"},
                new CitaInfo{Cita="Cita 3", Hora="08:00", Fecha="3/7/2023"},
                new CitaInfo{Cita="Cita 4", Hora="08:30", Fecha="5/7/2023"},
                new CitaInfo{Cita="Cita 5", Hora="08:30", Fecha="7/7/2023"},
                new CitaInfo{Cita="Cita 6", Hora="10:30", Fecha="10/7/2023"},
                new CitaInfo{Cita="Cita 7", Hora="10:00", Fecha="12/7/2023"},
                new CitaInfo{Cita="Cita 8", Hora="14:00", Fecha="13/7/2023"},
                new CitaInfo{Cita="Cita 9", Hora="15:30", Fecha="17/7/2023"},
                new CitaInfo{Cita="Cita 10", Hora="15:00", Fecha="19/7/2023"},
            };
            SearchResultsListView.ItemsSource = myList;

            userId = loggedInUserId;

        }
    }
}