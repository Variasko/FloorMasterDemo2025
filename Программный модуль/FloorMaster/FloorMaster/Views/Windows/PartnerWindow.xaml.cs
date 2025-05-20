using FloorMaster.DataBase;
using FloorMaster.Helpers;
using System.Linq;
using System.Windows;

namespace FloorMaster.Views.Windows
{
    /// <summary>
    /// Interaction logic for PartnerWindow.xaml
    /// </summary>
    public partial class PartnerWindow : Window
    {
        private readonly FloorMasterEntities _db = new FloorMasterEntities().GetContext();
        private PartnerCardGenerator _pcg = new PartnerCardGenerator();
        public PartnerWindow()
        {
            InitializeComponent();
            PartnerScroll.Content = _pcg.GetCards();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();Close();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            new PartnerAddEditWindow().ShowDialog();
            PartnerScroll.Content = _pcg.GetCards();
        }
    }
}
