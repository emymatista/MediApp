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
    public partial class Login : ContentPage
    {
        public Login()
        {
            InitializeComponent();
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MenuPrincipal());
            /*
            if (txtUsuario.Text == "admin" && txtContrasena.Text == "123")
            {
                await Navigation.PushAsync(new MenuPrincipal());
            }
            else
            {
                await DisplayAlert("Vaya...", "Usuario o Contraseña incorrecta!", "Ok");
            }
            */
        }

        private void TapGestureRecognizer_Tapped(object sender, EventArgs e)
        {
            Navigation.PushAsync(new RegistrarUsuario());
        }
    }
}