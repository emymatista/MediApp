using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedApp
{
    public class MenuPrincipalFlyoutMenuItem
    {
        public MenuPrincipalFlyoutMenuItem()
        {
            TargetType = typeof(MenuPrincipalFlyoutMenuItem);
        }
        public int Id { get; set; }
        public string Title { get; set; }

        public Type TargetType { get; set; }
        public string IconSource { get; set; }
    }
}