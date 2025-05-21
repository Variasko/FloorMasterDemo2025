using ClassLibrary;

namespace Demonstration
{
    class App
    {
        public static void Main()
        {
            MaterialCalculatorLib _mcl = new MaterialCalculatorLib();

            Console.Write("Введите тип продукции: ");
            int productType = int.Parse(Console.ReadLine());

            Console.Write("Введите тип материала: ");
            int materialType = int.Parse(Console.ReadLine());

            Console.Write("Введите количество желаемой продукции: ");
            int productAmount = int.Parse(Console.ReadLine());

            Console.Write("Введите параметр 1: ");
            double param1 = double.Parse(Console.ReadLine());

            Console.Write("Введите параметр 2: ");
            double param2 = double.Parse(Console.ReadLine());

            int result = _mcl.CalculateMaterial(productType, materialType, productAmount, param1, param2);

            Console.WriteLine($"На {productAmount} ед. продукции " +
                              $"потребуется {result} ед. материала.");
        }
    }
}