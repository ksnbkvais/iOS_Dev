//
//  problem6.swift
//  
//
//  Created by Aisulu Kasenbekova on 03.10.2024.
//

import Foundation
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    
    var arr: [Int] = [0, 1]

    if n == 1 {
        return [0]
    }
    
    if n == 2 {
        return arr
    }
    
    for i in 2..<n {
        let x = arr[i - 1] + arr[i - 2]  //dobavlyaem v array
        arr.append(x)
    }
    
    return arr
}


print(fibonacci(4))
