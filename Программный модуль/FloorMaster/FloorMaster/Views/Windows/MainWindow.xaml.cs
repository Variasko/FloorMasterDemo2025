using System.Windows;

namespace FloorMaster.Views.Windows
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void PartnerButton_Click(object sender, RoutedEventArgs e)
        {
            new PartnerWindow().Show();Close();
        }

        private void SalesButton_Click(object sender, RoutedEventArgs e)
        {
            new SalesWindow().Show();Close();
        }
    }
}
