using FloorMaster.DataBase;
using FloorMaster.Views.Windows;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace FloorMaster.Helpers
{
    internal class PartnerCardGenerator
    {
        private readonly FloorMasterEntities _db = new FloorMasterEntities().GetContext();
        private readonly List<Partner> _partners;
        private readonly List<Sale> _sales;

        public PartnerCardGenerator()
        {
            _partners = _db.Partner.ToList();
            _sales = _db.Sale.ToList();
        }

        private int CalculateDiscount(Partner partner)
        {
            var totalSales = _sales
                .Where(s => s.PartnerId == partner.Id)
                .Sum(s => (decimal)s.Amount);

            if (totalSales > 10000 && totalSales < 50000)
                return 5;

            if (totalSales >= 50000 && totalSales < 300000)
                return 10;

            if (totalSales >= 300000)
                return 15;

            return 0;
        }

        public StackPanel GetCards()
        {
            var stackPanel = new StackPanel { Name = "CardsStack" };

            foreach (var partner in _partners)
            {
                stackPanel.Children.Add(GenerateCard(partner));
            }

            return stackPanel;
        }

        private Border GenerateCard(Partner partner)
        {
            var mainStack = new StackPanel();

            // Header Section
            var headerGrid = new Grid();
            var leftHeader = CreateHeaderLeft(partner);
            var rightHeader = CreateHeaderRight(partner);
            headerGrid.Children.Add(leftHeader);
            headerGrid.Children.Add(rightHeader);

            // Content Section
            var directorBlock = CreateDirectorBlock(partner.Company);
            var phoneBlock = new TextBlock { Text = "1" }; // Заглушка
            var ratingBlock = CreateRatingBlock(partner.Rating);

            mainStack.Children.Add(headerGrid);
            mainStack.Children.Add(directorBlock);
            mainStack.Children.Add(phoneBlock);
            mainStack.Children.Add(ratingBlock);

            Border card = new Border
            {
                Margin = new Thickness(100, 20, 100, 20),
                Padding = new Thickness(10),
                Name = "CardItem",
                Child = mainStack,
                Style = (Style)Application.Current.FindResource("CardItem")
            };

            AddCardClickHandler(card, partner); // Добавляем обработчик клика

            // Эффекты при наведении (опционально)
            card.MouseEnter += (s, e) => card.Background = Brushes.LightGray;
            card.MouseLeave += (s, e) => card.Background = (Brush)new BrushConverter().ConvertFrom("#f4e8d3");

            return card;
        }

        private StackPanel CreateHeaderLeft(Partner partner)
        {
            var stack = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                HorizontalAlignment = HorizontalAlignment.Left
            };

            stack.Children.Add(new TextBlock
            {
                Text = partner.PartnerType.Name,
                Name = "PartnerTypeTB"
            });

            stack.Children.Add(new TextBlock { Text = " | " });

            stack.Children.Add(new TextBlock
            {
                Text = partner.Company.Name,
                Name = "CompanyNameTB"
            });

            return stack;
        }

        private StackPanel CreateHeaderRight(Partner partner)
        {
            var stack = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                HorizontalAlignment = HorizontalAlignment.Right
            };

            stack.Children.Add(new TextBlock
            {
                Text = $"{CalculateDiscount(partner)}%"
            });

            return stack;
        }

        private TextBlock CreateDirectorBlock(Company company)
        {
            return new TextBlock
            {
                Name = "DirectorTB",
                Text = $"{company.DirectorSurname} " +
                       $"{company.DirectorName} " +
                       $"{company.DirectorPatronymic}"
            };
        }

        private TextBlock CreateRatingBlock(decimal rating)
        {
            return new TextBlock
            {
                Name = "RatingTB",
                Text = rating.ToString()
            };
        }
        // В класс PartnerCardGenerator добавляем:
        private void AddCardClickHandler(Border card, Partner partner)
        {
            card.MouseDown += (sender, e) =>
            {
                OpenPartnerEditorWindow(partner);
            };
        }

        public void OpenPartnerEditorWindow(Partner partner = null)
        {
            var editWindow = new PartnerAddEditWindow(partner);

            // Обновляем данные после закрытия окна
            editWindow.Closed += (s, e) =>
            {
                RefreshPartnerData();
            };

            editWindow.ShowDialog();
        }

        private void RefreshPartnerData()
        {
            _partners.Clear();
            _partners.AddRange(_db.Partner.ToList());
        }
    }
}