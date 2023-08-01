using MedApp.Datos;
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
            NavigationPage.SetHasBackButton(this, false);
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string contrasena = txtContrasena.Text;

            AuthService authService = new AuthService();

            bool isAuthenticated = await authService.LoginAsync(usuario, contrasena);

            if (isAuthenticated)
            {
                await Navigation.PushAsync(new MenuPrincipal());
            }
            else
            {
                await DisplayAlert("Error", "Nombre usuario o contraseña incorrecta", "OK");
            }

            /*
            //await Navigation.PushAsync(new MenuPrincipal());
            
            if (txtUsuario.Text == "admin" && txtContrasena.Text == "123")
                await Navigation.PushAsync(new MenuPrincipal());
            else
            {
                await DisplayAlert("Vaya...", "Usuario o Contraseña incorrecta!", "Ok");
            }
            */
        }

        private async void TapGestureRecognizer_Tapped(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new RegistrarUsuario());
        }

        private void switchShowPassword_Toggled(object sender, ToggledEventArgs e)
        {
            txtContrasena.IsPassword = !e.Value;
        }
    }
}