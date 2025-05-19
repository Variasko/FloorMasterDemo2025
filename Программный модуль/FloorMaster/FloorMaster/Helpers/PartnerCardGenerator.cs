using FloorMaster.DataBase;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;
using System.Windows;

namespace FloorMaster.Helpers
{
    internal class PartnerCardGenerator
    {
        private readonly FloorMasterEntities _db = new FloorMasterEntities().GetContext();
        private readonly List<Partner> _partners;
        //private readonly List<Company> _companys;
        //private readonly List<ContactInfo> _contactInfos;
        private readonly List<Sale> _sales;

        public PartnerCardGenerator()
        {
            _partners = _db.Partner.ToList();
            //_companys = _db.Company.ToList();
            //_contactInfos = _db.ContactInfo.ToList();
            _sales = _db.Sale.ToList();
        }

        private int CalculateDescount(Partner partner)
        {
            var salesOfpartner = _sales.Where(s => s.PartnerId == partner.Id).ToList();
            decimal sum = 0;
            foreach (var sale in salesOfpartner)
            {
                sum += (decimal)sale.Amount;
            }

            if (sum > 10000 && sum < 50000)
                return 5;

            if (sum >= 50000 && sum < 300000)
                return 10;

            if (sum >= 300000)
                return 15;
            return 0;
        }
        public StackPanel GetCards()
        {
            var cards = new StackPanel();

            foreach (var p in _partners)
            {
                Border card = GenerateCard(p);
                cards.Children.Add(card);
            }

            return cards;
        }
        public Border GenerateCard(Partner p)
        {
            string type = p.PartnerType.Name;
            string companyName = p.Company.Name;
            int discount = CalculateDescount(p);
            string director = $"{p.Company.DirectorSurname} " +
                              $"{p.Company.DirectorName} " +
                              $"{p.Company.DirectorPatronymic}";
            string contactPhone = "1";
            decimal rating = p.Rating;

            Border card = new Border
            {
                Margin = new Thickness(100, 20, 100, 20),
                Padding = new Thickness(10)
            };
            StackPanel mainCardStack = new StackPanel();
            Grid hat = new Grid();
            StackPanel hatStack = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                HorizontalAlignment = HorizontalAlignment.Left
            };

            TextBlock pTypeTB = new TextBlock
            {
                Text = type
            };
            TextBlock slash = new TextBlock
            {
                Text = " | "
            };
            TextBlock cName = new TextBlock
            {
                Text = companyName
            };
            hatStack.Children.Add(pTypeTB);
            hatStack.Children.Add(slash);
            hatStack.Children.Add(cName);

            StackPanel discStack = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                HorizontalAlignment = HorizontalAlignment.Right
            };
            TextBlock discountTB = new TextBlock
            {
                Text = $"{discount}%"
            };
            discStack.Children.Add(discountTB);

            hat.Children.Add(hatStack);
            hat.Children.Add(discStack);

            mainCardStack.Children.Add(hat);

            TextBlock directorTB = new TextBlock
            {
                Text = director
            };
            TextBlock contactTB = new TextBlock
            {
                Text = contactPhone
            };
            TextBlock ratingTB = new TextBlock
            {
                Text = $"{rating}"
            };
            mainCardStack.Children.Add(directorTB);
            mainCardStack.Children.Add(contactTB);
            mainCardStack.Children.Add(ratingTB);

            card.Child = mainCardStack;
            return card;
        }
    }
}
