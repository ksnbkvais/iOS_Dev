//
//  Problem_1.swift
//  
//
//  Created by Aisulu Kasenbekova on 27.09.2024.
//

import Foundation
func pr() {
    for number in 1...100 {
        if number % 3 == 0 && number % 5 == 0 {
            print("FizBuzz")
        }
        else if number % 3 == 0 {
            print("Fizz")
        }
        else if number % 5 == 0{
            print("Buzz")
        }
        else {
            print(number)
        }
    }
}

pr()
