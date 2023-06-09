//
//  Numbers.swift
//  
//
//  Created by Alex Cucos on 04.04.2023.
//

import Foundation

extension CharacterProvider {
    static let numbers: [Character] = [
        Character(character: "1",
                  morse: [.dot, .line, .line, .line, .line],
                  word: "One"),
        
        Character(character: "2",
                  morse: [.dot, .dot, .line, .line, .line],
                  word: "Two"),
        
        Character(character: "3",
                  morse: [.dot, .dot, .dot, .line, .line],
                  word: "Three"),
        
        Character(character: "4",
                  morse: [.dot, .dot, .dot, .dot, .line],
                  word: "Four"),
        
        Character(character: "5",
                  morse: [.dot, .dot, .dot, .dot, .dot],
                  word: "Five"),
        
        Character(character: "6",
                  morse: [.line, .dot, .dot, .dot, .dot],
                  word: "Six"),
        
        Character(character: "7",
                  morse: [.line, .line, .dot, .dot, .dot],
                  word: "Seven"),
        
        Character(character: "8",
                  morse: [.line, .line, .line, .dot, .dot],
                  word: "Eight"),
        
        Character(character: "9",
                  morse: [.line, .line, .line, .line, .dot],
                  word: "Nine"),
        
        Character(character: "0",
                  morse: [.line, .line, .line, .line, .line],
                  word: "Zero"),
    ]
}
