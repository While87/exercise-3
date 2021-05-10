//
//  main.swift
//  test exercise 3
//
//  Created by Vladimir Gorbunov on 09.05.2021.
//

import Foundation
print("------------------------------------------------------------------------")
print("                 GitHub user repositories seacher")
print("To get a list of repositories, please input name. For exit enter --EXIT")
print("------------------------------------------------------------------------")


while true {
    
    var inputString = readLine()
    
    //preparing string. Removing doubl whitespaces and tabulations
    inputString = inputString?.trimmingCharacters(in: .whitespaces)
    while inputString!.contains("  ") || inputString!.contains("\u{0009}") {
        inputString = inputString?.replacingOccurrences(of: "  ", with: " ")
        inputString = inputString?.replacingOccurrences(of: "\u{0009}", with: " ")
    }
    
    if inputString == "" || inputString == " " {
        continue
    } else if inputString == "--EXIT" || inputString == "--Exit" || inputString == "--exit" {
        print("Bye!")
        break
    } else {
        printRepoList(forUser: inputString!)
    }
}
