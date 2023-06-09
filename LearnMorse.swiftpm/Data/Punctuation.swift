//
//  Punctuation.swift
//  
//
//  Created by Alex Cucos on 18.04.2023.
//

import Foundation

extension CharacterProvider {
    static let punctuation: [Character] = [
        Character(character: ".",
                  morse: [.dot, .line, .dot, .line, .dot, .line],
                  word: "Period"),
        
        Character(character: ",",
                  morse: [.line, .line, .dot, .dot, .line, .line],
                  word: "Comma"),
        
        Character(character: ":",
                  morse: [.line, .line, .line, .dot, .dot, .dot],
                  word: "Colon"),
        
        Character(character: ";",
                  morse: [.line, .dot, .line, .dot, .line, .dot],
                  word: "Semicolon"),
        
        Character(character: "?",
                  morse: [.dot, .dot, .line, .line, .dot, .dot],
                  word: "Question mark"),
        
        Character(character: "!",
                  morse: [.line, .dot, .line, .dot, .line, .line],
                  word: "Exclamation point"),
        
        Character(character: "-",
                  morse: [.line, .dot, .dot, .dot, .dot, .line],
                  word: "Hyphen"),
        
        Character(character: "/",
                  morse: [.line, .dot, .dot, .line, .dot],
                  word: "Slash"),
        
        Character(character: "@",
                  morse: [.dot, .line, .line, .dot, .line, .dot],
                  word: "At sign")
    ]
}
