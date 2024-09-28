//
//  problem4.swift
//  
//
//  Created by Aisulu Kasenbekova on 28.09.2024.
//

import Foundation

func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter { $0.isLetter || $0.isNumber }
    
    let reversedText = String(cleanedText.reversed())
    
    return cleanedText == reversedText
}

print(isPalindrome("anna anna"))
