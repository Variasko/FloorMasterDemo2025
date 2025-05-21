using FloorMaster.DataBase;
using System.Linq;
using System.Windows;

namespace FloorMaster.Views.Windows
{
    /// <summary>
    /// Interaction logic for SalesWindow.xaml
    /// </summary>
    public partial class SalesWindow : Window
    {
        private readonly FloorMasterEntities _db = new FloorMasterEntities().GetContext();
        public SalesWindow()
        {
            InitializeComponent();
            SaleDataGrid.ItemsSource = _db.Sale.ToList();
        }

        private void ApplyButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Filter.Text)) ShowError();

            if (ByPartner.IsChecked == true)
                SaleDataGrid.ItemsSource = _db.Sale
                    .Where(s => s.Partner.Company.Name.Contains(Filter.Text))
                    .ToList();
            if (ByProduct.IsChecked == true)
                SaleDataGrid.ItemsSource = _db.Sale
                    .Where(s => s.Product.Name.Contains(Filter.Text))
                    .ToList();
        }

        private void ShowError()
        {
            MessageBox.Show("Не все поля заполнены",
                            "Что-то пошло не так! :(",
                            MessageBoxButton.OK,
                            MessageBoxImage.Error);
        }

        private void DenyButton_Click(object sender, RoutedEventArgs e)
        {
            SaleDataGrid.ItemsSource = _db.Sale.ToList();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();Close();
        }
    }
}
