//
//  Problem_3.swift
//  
//
//  Created by Aisulu Kasenbekova on 27.09.2024.
//

import Foundation

func cToF(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func cToK(_ c: Double) -> Double {
    return c + 273.15
}

func fToC(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fToK(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kToC(_ k: Double) -> Double {
    return k - 273.15
}

func kToF(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}

func convert() {
    print("Enter Double temperature value:")
    guard let input = readLine(), let temperatureValue = Double(input) else {
        print("Double!!!")
        return
    }
    
    print("Enter C, F or K ):")
    guard let unit = readLine()?.uppercased(), ["C", "F", "K"].contains(unit) else {
        print("Enter C, F, or K!!!😊")
        return
    }
    
    switch unit {
    case "C":
        let f = cToF(temperatureValue)
        let kelvin = cToK(temperatureValue)
        print("\(temperatureValue)°C is equal to \(f)°F and \(kelvin)K.")
        
    case "F":
        let celsius = fToC(temperatureValue)
        let kelvin = fToK(temperatureValue)
        print("\(temperatureValue)°F is equal to \(celsius)°C and \(kelvin)K.")
        
    case "K":
        let celsius = kToC(temperatureValue)
        let f = kToF(temperatureValue)
        print("\(temperatureValue)K is equal to \(celsius)°C and \(f)°F.")
        
//    default:
//        print("Invalid unit. Please enter C, F, or K.")
    default:
        print("Enetr C F or K")
    
    }
}

convert()
