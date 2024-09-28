//
//  main.swift
//  proble4
//
//  Created by Aisulu Kasenbekova on 28.09.2024.
//

import Foundation

var shoppinglist: [String] = []
func menu(){
    print ("""
Shopping list manager
menu:
1 Add item to lis
2 Remove item
3 Display list
4 Exit

Enter one number from 1-4

"""
    )
}
func addItem(){
    print("Enter item")
    if let item = readLine(), !item.isEmpty {
        shoppinglist.append(item)}
    else{
        print("napishi")
        
    }
}
func remove(){
    if shoppinglist.isEmpty{
        print("nothing to remove")
        return
    }
    print("Enter item ")
    if let item = readLine(), shoppinglist.contains(item) {
        guard let index = shoppinglist.firstIndex(of: item) else { return }
        shoppinglist.remove(at: index)
    }
}
func display(){
    if shoppinglist.isEmpty{
        print("nothing here")
        return
    }
    else{
        for (index, item) in shoppinglist.enumerated() {
            print("\(index+1) \(item)")
        }
    }
}
func shopping(){
    var shouldExit = false
    while !shouldExit{
        menu()
        if let input = readLine(), let a = Int(input) {
            switch a {
            case 1:
                addItem()
            case 2:
                remove()
            case 3:
                display()
            case 4:
                print("ByeBye")
                shouldExit = true
            default:
                print("ot 1 do 4")
            }}
        else {
            print("number !!! 1-4")
        }
    }
}
shopping()

