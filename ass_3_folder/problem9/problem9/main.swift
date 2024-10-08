//
//  main.swift
//  problem9
//
//  Created by Aisulu Kasenbekova on 04.10.2024.
//

import Foundation

func add(_ num1: Double, _ num2: Double) -> Double {
    return num1 + num2
}

func subtract(_ num1: Double, _ num2: Double) -> Double {
    return num1 - num2
}

func multiply(_ num1: Double, _ num2: Double) -> Double {
    return num1 * num2
}

func divide(_ num1: Double, _ num2: Double) -> Double? {
    if num2 == 0 {
        return nil
    } else {
        return num1 / num2
    }
}

func getInput(prompt: String) -> Double {
    print(prompt)
    if let input = readLine(), let number = Double(input) {
        return number
    } else {
        print("Invalid input. Please enter a valid number.")
        return getInput(prompt: prompt)
    }
}

func calculator() {
    var continueCalculating = true

    while continueCalculating {
        let num1 = getInput(prompt: "Enter the first number: ")
        let num2 = getInput(prompt: "Enter the second number: ")

        print("Choose an operation (+, -, *, /) or type 'exit' to quit: ", terminator: "")
        if let operation = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
            switch operation {
            case "+":
                print("Result: \(add(num1, num2))")
            case "-":
                print("Result: \(subtract(num1, num2))")
            case "*":
                print("Result: \(multiply(num1, num2))")
            case "/":
                if let result = divide(num1, num2) {
                    print("Result: \(result)")
                } else {
                    print("Error: Division by zero is not allowed.")
                }
            case "exit":
                continueCalculating = false
                print("Exiting calculator. Goodbye!")
            default:
                print("Invalid operation. Please choose one of +, -, *, /.")
            }
        }
    }
}

calculator()


