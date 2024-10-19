using System;
using System.Collections.Generic;

class Program
{
    // Define the Todo list as a global variable
    static List<string> todoList = new List<string>();

    static void Main(string[] args)
    {
        bool exit = false;

        while (!exit)
        {
            Console.Clear();
            Console.WriteLine("TODO LIST APPLICATION");
            Console.WriteLine("=====================");
            Console.WriteLine("1. Add a task");
            Console.WriteLine("2. View tasks");
            Console.WriteLine("3. Remove a task");
            Console.WriteLine("4. Exit");
            Console.Write("\nSelect an option (1-4): ");

            switch (Console.ReadLine())
            {
                case "1":
                    AddTask();
                    break;
                case "2":
                    ViewTasks();
                    break;
                case "3":
                    RemoveTask();
                    break;
                case "4":
                    exit = true;
                    break;
                default:
                    Console.WriteLine("Invalid option! Press any key to continue.");
                    Console.ReadKey();
                    break;
            }
        }
    }

    static void AddTask()
    {
        Console.Clear();
        Console.Write("Enter the task description: ");
        string task = Console.ReadLine();
        todoList.Add(task);
        Console.WriteLine("Task added! Press any key to return to the menu.");
        Console.ReadKey();
    }

    static void ViewTasks()
    {
        Console.Clear();
        if (todoList.Count == 0)
        {
            Console.WriteLine("No tasks available.");
        }
        else
        {
            Console.WriteLine("Your Todo List:");
            for (int i = 0; i < todoList.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {todoList[i]}");
            }
        }
        Console.WriteLine("Press any key to return to the menu.");
        Console.ReadKey();
    }

    static void RemoveTask()
    {
        Console.Clear();
        if (todoList.Count == 0)
        {
            Console.WriteLine("No tasks to remove.");
            Console.WriteLine("Press any key to return to the menu.");
            Console.ReadKey();
            return;
        }

        Console.WriteLine("Your Todo List:");
        for (int i = 0; i < todoList.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {todoList[i]}");
        }

        Console.Write("Enter the number of the task to remove: ");
        if (int.TryParse(Console.ReadLine(), out int index) && index >= 1 && index <= todoList.Count)
        {
            todoList.RemoveAt(index - 1);
            Console.WriteLine("Task removed! Press any key to return to the menu.");
        }
        else
        {
            Console.WriteLine("Invalid number! Press any key to return to the menu.");
        }
        Console.ReadKey();
    }
}