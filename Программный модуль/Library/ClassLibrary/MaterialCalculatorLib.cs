using System;
using System.Data.Entity;
using System.Linq;

namespace ClassLibrary
{
    public class MaterialCalculatorLib
    {
        private readonly FloorMasterEntities _db = new FloorMasterEntities();

        public int CalculateMaterial(
            int productTypeId,
            int materialTypeId,
            int productAmount,
            double param1,
            double param2
        )
        {
            try
            {
                // Валидация входных параметров
                if (productAmount <= 0 || param1 <= 0 || param2 <= 0)
                    return -1;

                // Проверка существования типа продукции
                var productType = _db.ProductType
                    .AsNoTracking()
                    .FirstOrDefault(pt => pt.Id == productTypeId);

                if (productType == null || productType.ProductTypeCoefficient <= 0)
                    return -1;

                // Проверка существования типа материала
                var materialType = _db.MaterialType
                    .AsNoTracking()
                    .FirstOrDefault(mt => mt.Id == materialTypeId);

                if (materialType == null || materialType.PercentageDefectiveMaterial < 0)
                    return -1;

                // Расчет материала на единицу продукции
                double materialPerUnit = param1 * param2 * (double)productType.ProductTypeCoefficient;

                // Учет брака
                double totalMaterial = materialPerUnit * productAmount;
                totalMaterial *= (1 + (double)materialType.PercentageDefectiveMaterial);

                // Округление вверх до целого
                return (int)Math.Ceiling(totalMaterial);
            }
            catch
            {
                return -1;
            }
        }
    }
}