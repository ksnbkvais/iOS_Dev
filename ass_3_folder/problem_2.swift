//
//  problem_2.swift
//  
//
//  Created by Aisulu Kasenbekova on 27.09.2024.
//

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    
    if number == 2 || number == 3 {
        return true
    }
        

    if number >= 4 {
        for x in 2...Int(number-1) {
            if number % x == 0 {
                return false
            }
        }
    }
    
    return true
        
    
}

for i in 1...100 {
    if isPrime(i) {
        print(i)
    }
}
