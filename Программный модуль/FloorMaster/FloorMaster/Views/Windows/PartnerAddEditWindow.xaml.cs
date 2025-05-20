using FloorMaster.DataBase;
using System.Linq;
using System.Windows;

namespace FloorMaster.Views.Windows
{
    public partial class PartnerAddEditWindow : Window
    {
        private readonly FloorMasterEntities _db = new FloorMasterEntities().GetContext();
        private readonly Partner _currentPartner;
        private readonly Company _currentCompany;
        private readonly bool _isEditMode;

        public PartnerAddEditWindow(Partner partner)
        {
            InitializeComponent();
            _currentPartner = partner;
            _currentCompany = partner.Company;
            _isEditMode = true;

            SaveButton.Click += SaveEditButton_Click;

            LoadData();
            FillFields();
        }

        public PartnerAddEditWindow()
        {
            InitializeComponent();
            _isEditMode = false;

            SaveButton.Click += SaveCreateButton_Click;

            LoadData();
        }
        private void LoadData()
        {
            var types = _db.PartnerType.ToList();
            PartnerType.ItemsSource = types;
            PartnerType.DisplayMemberPath = "Name";
            PartnerType.SelectedValuePath = "Id";
            PartnerType.SelectedIndex = 0;
        }
        private void FillFields()
        {
            CompanyNameTextBox.Text = _currentCompany.Name;
            Address.Text = _currentCompany.BusinessAddress;
            INN.Text = _currentCompany.INN;
            PartnerType.SelectedValue = _currentPartner.PartnerType.Id;
            DirSur.Text = _currentCompany.DirectorSurname;
            DirName.Text = _currentCompany.DirectorName;
            DirPat.Text = _currentCompany.DirectorPatronymic;
            Rating.Text = _currentPartner.Rating.ToString();
        }

        private void SaveEditButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void SaveCreateButton_Click(object sender, RoutedEventArgs e)
        {
            Company newCompany = new Company
            {
                Name = CompanyNameTextBox.Text,
                BusinessAddress = Address.Text,
                INN = INN.Text,
                DirectorSurname = DirSur.Text,
                DirectorName = DirName.Text,
                DirectorPatronymic = DirPat.Text,
            };
            _db.Company.Add(newCompany);
            _db.SaveChanges();
            newCompany = _db.Company.Where(c=>c.Name ==  CompanyNameTextBox.Text).FirstOrDefault();
            Partner newPartner = new Partner
            {
                CompanyId = newCompany.Id,
                Rating = int.Parse(Rating.Text),
                PartnerTypeId = int.Parse(PartnerType.SelectedValue.ToString())
            };
            _db.Partner.Add(newPartner);
            _db.SaveChanges();
            Close();
        }
    }
}