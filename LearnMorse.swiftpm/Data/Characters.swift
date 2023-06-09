//
//  Characters.swift
//  Learn Morse
//
//  Created by Alex Cucos on 01.04.2023.
//

import Foundation

enum Morse {
    case dot
    case line
}

struct Character: Hashable, Identifiable {
    var id = UUID()
    
    let character: String
    let morse: [Morse]
    let word: String?
}

struct CharacterProvider {
    static let alphabetical: [Character] = {
        return byDifficulty.sorted { c1, c2 in
            c1.character < c2.character
        }
    }()
    
    static let byDifficulty: [Character] = [
        Character(character: "E",
                  morse: [.dot],
                  word: "Eat"),
        
        Character(character: "T",
                  morse: [.line],
                  word: "Tape"),
        
        Character(character: "A",
                  morse: [.dot, .line],
                  word: "Apple"),
        
        Character(character: "O",
                  morse: [.line, .line, .line],
                  word: "Over"),
        
        Character(character: "N",
                  morse: [.line, .dot],
                  word: "Noodle"),
        
        Character(character: "I",
                  morse: [.dot, .dot],
                  word: "Ivy"),
        
        Character(character: "S",
                  morse: [.dot, .dot, .dot],
                  word: "Scissors"),
        
        Character(character: "H",
                  morse: [.dot, .dot, .dot, .dot],
                  word: "Handhold"),
        
        Character(character: "R",
                  morse: [.dot, .line, .dot],
                  word: "Running"),
        
        Character(character: "D",
                  morse: [.line, .dot, .dot],
                  word: "Dripdrop"),
        
        Character(character: "L",
                  morse: [.dot, .line, .dot, .dot],
                  word: "Lazy"),
        
        Character(character: "U",
                  morse: [.dot, .dot, .line],
                  word: "U-turn"),
        
        Character(character: "W",
                  morse: [.dot, .line, .line],
                  word: "Waterfall"),
        
        Character(character: "K",
                  morse: [.line, .dot, .line],
                  word: "Kangaroo"),
        
        Character(character: "G",
                  morse: [.line, .line, .dot],
                  word: "Gumshoe"),
        
        Character(character: "M",
                  morse: [.line, .line],
                  word: "Mailman"),
        
        Character(character: "Y",
                  morse: [.line, .dot, .line, .line],
                  word: "Yellow"),
        
        Character(character: "P",
                  morse: [.dot, .line, .line, .dot],
                  word: "Pitter-patter"),
        
        Character(character: "B",
                  morse: [.line, .dot, .dot, .dot],
                  word: "Bedbug"),
        
        Character(character: "V",
                  morse: [.dot, .dot, .dot, .line],
                  word: "Voicemail"),
        
        Character(character: "C",
                  morse: [.line, .dot, .line, .dot],
                  word: "Catastrophic"),
        
        Character(character: "F",
                  morse: [.dot, .dot, .line, .dot],
                  word: "Fiddle"),
        
        Character(character: "J",
                  morse: [.dot, .line, .line, .line],
                  word: "Jumping"),
        
        Character(character: "Q",
                  morse: [.line, .line, .dot, .line],
                  word: "Quick"),
        
        Character(character: "X",
                  morse: [.line, .dot, .dot, .line],
                  word: "Xbox"),
        
        Character(character: "Z",
                  morse: [.line, .line, .dot, .dot],
                  word: "Zigzag")
    ]
    
    func forLetter(_ letter: String) -> Character {
        CharacterProvider.byDifficulty.first { $0.character == letter } ?? CharacterProvider.byDifficulty[0]
    }
}
