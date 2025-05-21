using FloorMaster.DataBase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Windows;

namespace FloorMaster.Views.Windows
{
    public partial class PartnerAddEditWindow : Window
    {
        private readonly FloorMasterEntities _db;
        private readonly Partner _currentPartner;
        private readonly Company _currentCompany;
        private readonly bool _isEditMode;

        // Конструктор для редактирования
        public PartnerAddEditWindow(Partner partner)
        {
            InitializeComponent();
            _db = new FloorMasterEntities().GetContext();
            _isEditMode = true;

            // Перезагрузка сущности в текущем контексте
            _currentPartner = _db.Partner
                .Include(p => p.Company)
                .First(p => p.Id == partner.Id);

            _currentCompany = _currentPartner.Company;

            InitializeUI();
        }

        // Конструктор для создания
        public PartnerAddEditWindow()
        {
            InitializeComponent();
            _db = new FloorMasterEntities().GetContext();
            _isEditMode = false;

            _currentCompany = new Company();
            _currentPartner = new Partner();

            InitializeUI();
        }

        private void InitializeUI()
        {
            SaveButton.Click += SaveButton_Click;
            LoadPartnerTypes();
            if (_isEditMode) FillFields();
        }

        private void LoadPartnerTypes()
        {
            PartnerType.ItemsSource = _db.PartnerType.ToList();
            PartnerType.DisplayMemberPath = "Name";
            PartnerType.SelectedValuePath = "Id";
            PartnerType.SelectedIndex = 0;
        }

        private void FillFields()
        {
            CompanyNameTextBox.Text = _currentCompany.Name;
            Address.Text = _currentCompany.BusinessAddress;
            INN.Text = _currentCompany.INN;
            PartnerType.SelectedValue = _currentPartner.PartnerTypeId;
            DirSur.Text = _currentCompany.DirectorSurname;
            DirName.Text = _currentCompany.DirectorName;
            DirPat.Text = _currentCompany.DirectorPatronymic;
            Rating.Text = _currentPartner.Rating.ToString(CultureInfo.InvariantCulture);
        }

        private bool ValidateInput()
        {
            var errors = new List<string>();

            if (string.IsNullOrWhiteSpace(CompanyNameTextBox.Text))
                errors.Add("• Название компании обязательно");

            if (string.IsNullOrWhiteSpace(DirSur.Text))
                errors.Add("• Фамилия директора обязательна");

            if (string.IsNullOrWhiteSpace(INN.Text) || !INN.Text.All(char.IsDigit))
                errors.Add("• ИНН должен содержать только цифры");

            if (PartnerType.SelectedValue == null)
                errors.Add("• Выберите тип партнера");

            if (!decimal.TryParse(Rating.Text, NumberStyles.Number, CultureInfo.InvariantCulture, out var rating)
                || rating < 0 || rating > 11)
            {
                errors.Add("• Рейтинг должен быть числом от 0 до 10");
            }

            if (errors.Count == 0) return true;

            MessageBox.Show(
                string.Join("\n", errors),
                "Ошибки ввода",
                MessageBoxButton.OK,
                MessageBoxImage.Warning
            );
            return false;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidateInput()) return;

            try
            {
                UpdateEntities();
                SaveChanges();
                ShowSuccessMessage();
                Close();
            }
            catch (Exception ex)
            {
                HandleError(ex);
            }
        }

        private void UpdateEntities()
        {
            _currentCompany.Name = CompanyNameTextBox.Text.Trim();
            _currentCompany.BusinessAddress = Address.Text.Trim();
            _currentCompany.INN = INN.Text.Trim();
            _currentCompany.DirectorSurname = DirSur.Text.Trim();
            _currentCompany.DirectorName = DirName.Text.Trim();
            _currentCompany.DirectorPatronymic = DirPat.Text.Trim();

            _currentPartner.PartnerTypeId = (int)PartnerType.SelectedValue;
            _currentPartner.Rating = decimal.Parse(Rating.Text, CultureInfo.InvariantCulture);

            if (!_isEditMode)
            {
                _db.Company.Add(_currentCompany);
                _db.Partner.Add(_currentPartner);
            }
        }

        private void SaveChanges()
        {
            _db.SaveChanges();
        }

        private void ShowSuccessMessage()
        {
            MessageBox.Show(
                _isEditMode ? "Данные успешно обновлены!\nДля просмотра изменений, перезайдите на страницу" 
                            : "Новый партнер создан!\nДля просмотра изменений, перезайдите на страницу",
                "Успех",
                MessageBoxButton.OK,
                MessageBoxImage.Information
            );
        }

        private void HandleError(Exception ex)
        {
            var errorMessage = ex.InnerException?.Message ?? ex.Message;
            MessageBox.Show(
                $"Ошибка сохранения:\n{errorMessage}",
                "Ошибка",
                MessageBoxButton.OK,
                MessageBoxImage.Error
            );
        }
    }
}