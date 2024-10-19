using System;

class Program
{
    static void Main(string[] args)
    {
        double num1, num2, result;
        char operation;

        // Input the first number
        Console.Write("Enter the first number: ");
        num1 = Convert.ToDouble(Console.ReadLine());

        // Input the operation
        Console.Write("Enter an operation (+, -, *, /): ");
        operation = Convert.ToChar(Console.ReadLine());

        // Input the second number
        Console.Write("Enter the second number: ");
        num2 = Convert.ToDouble(Console.ReadLine());

        // Perform the operation
        switch (operation)
        {
            case '+':
                result = num1 + num2;
                Console.WriteLine("Result: " + result);
                break;
            case '-':
                result = num1 - num2;
                Console.WriteLine("Result: " + result);
                break;
            case '*':
                result = num1 * num2;
                Console.WriteLine("Result: " + result);
                break;
            case '/':
                if (num2 != 0)
                {
                    result = num1 / num2;
                    Console.WriteLine("Result: " + result);
                }
                else
                {
                    Console.WriteLine("Error! Division by zero.");
                }
                break;
            default:
                Console.WriteLine("Invalid operation!");
                break;
        }

        // Prevent the console from closing immediately
        Console.WriteLine("Press any key to exit.");
        Console.ReadKey();
    }
}