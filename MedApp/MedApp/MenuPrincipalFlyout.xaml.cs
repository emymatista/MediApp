using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace MedApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MenuPrincipalFlyout : ContentPage
    {
        public ListView ListView;

        public MenuPrincipalFlyout()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            BindingContext = new MenuPrincipalFlyoutViewModel();
            ListView = MenuItemsListView;
        }

        private class MenuPrincipalFlyoutViewModel : INotifyPropertyChanged
        {
            public ObservableCollection<MenuPrincipalFlyoutMenuItem> MenuItems { get; set; }

            public MenuPrincipalFlyoutViewModel()
            {
                MenuItems = new ObservableCollection<MenuPrincipalFlyoutMenuItem>(new[]
                {
                    new MenuPrincipalFlyoutMenuItem { Id = 0, Title = "Buscar Medico", IconSource="Medico.png", TargetType=typeof(BuscarMedico) },
                    new MenuPrincipalFlyoutMenuItem { Id = 1, Title = "Reservar Cita", IconSource="Reserva.png", TargetType=typeof(ReservarCita) },
                    new MenuPrincipalFlyoutMenuItem { Id = 2, Title = "Citas pendientes", IconSource="Pendiente.png", TargetType=typeof(CitasPendientes) },
                    new MenuPrincipalFlyoutMenuItem { Id = 3, Title = "Historial de Citas", IconSource="Historial.png", TargetType=typeof(HistorialCitas)},
                    new MenuPrincipalFlyoutMenuItem { Id = 4, Title = "Modificar Cita", IconSource="Reserva.png", TargetType=typeof(ActualizarCita)},
                });
            }

            #region INotifyPropertyChanged Implementation
            public event PropertyChangedEventHandler PropertyChanged;
            void OnPropertyChanged([CallerMemberName] string propertyName = "")
            {
                if (PropertyChanged == null)
                    return;

                PropertyChanged.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
            #endregion
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            //App.IsUserLoggedIn = false;
            await Navigation.PushAsync(new Login());
        }
    }
}