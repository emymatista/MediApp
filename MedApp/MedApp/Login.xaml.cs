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
        private AuthService authService;
        public Login()
        {
            InitializeComponent();
            NavigationPage.SetHasBackButton(this, false);
            authService = new AuthService();
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            try
            {
                string usuario = txtUsuario.Text;
                string contrasena = txtContrasena.Text;

                Usuario loggedInUser = await authService.LoginAsync(usuario, contrasena);

                if (loggedInUser != null)
                {

                    int tipoUsuario = authService.GetTipoUsuario(txtUsuario.Text);

                    if (tipoUsuario == 1)
                    {
                        await Navigation.PushAsync(new MenuPrincipal(loggedInUser.idUsuario));
                    }
                    else if (tipoUsuario == 2)
                    {
                        //await Navigation.PushAsync(new MenuMedico());
                    }
                    else
                    {
                        await DisplayAlert("Vaya...", "Tipo de usuario no encontrado", "OK");
                        return;
                    }
                    //await Navigation.PushAsync(new MenuPrincipal(loggedInUser.idUsuario));
                    //await Navigation.PushAsync(new MenuMedico());

                }
                else
                {
                    await DisplayAlert("Vaya...", "Nombre usuario o contraseña incorrecta", "OK");
                }

            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", ex.Message, "OK");
                return;
            }

            /*            
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