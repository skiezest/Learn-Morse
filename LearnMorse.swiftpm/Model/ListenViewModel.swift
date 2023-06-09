//
//  SwiftUIView.swift
//  
//
//  Created by Alex Cucos on 02.04.2023.
//

import SwiftUI
import AVKit

class ListenViewModel: ObservableObject {
    @Published var openedCharacters: [Character] = [CharacterProvider.byDifficulty[0]] // An array with characters the user has opened
    
    //MARK: User Answer <-> Correct Answer
    @Published var correctAnswer: Character = CharacterProvider.byDifficulty[0]
    @Published var userAnswer = "" {
        didSet {
            checkAnswer()
        }
    }
    
    //MARK: Complexity
    // The sum of available letters is the complexity. As more letters are added, it gets harder over time. For example:
    // complexity(1) includes: [E]
    // complexity(3) includes: [E, T, A]
    // Complexity increases every 3 correct answers.
    @Published var complexity = 1 {
        didSet {
            UserDefaults.standard.set(complexity, forKey: "ListenViewModel_complexity")
            openedCharacters = CharacterProvider.byDifficulty.prefix(complexity).map { $0 }
            toast = ToastModel(symbol: "\(openedCharacters.last!.character.lowercased()).circle", text: "New letter opened!")
        }
    }
    
    //MARK: Counters
    @Published var correctAnswersCount = 0
    @Published var wrongAnswersCount = 0
    
    @Published var timer = Timer()
    @Published var lastAnswerStatus = AnswerStatus.none
    
    @Published var player = AVAudioPlayer()
    
    @Published var toast: ToastModel?
    
    init() {
        openedCharacters = CharacterProvider.byDifficulty.prefix(complexity).map { $0 }
        correctAnswer = openedCharacters.randomElement()!
    }
    
    func isCorrect() -> Bool {
        return userAnswer == correctAnswer.character
    }
    
    func checkAnswer() {
        timer.invalidate()
        
        guard userAnswer != "" else { return }
        if isCorrect() {
            //MARK: Answer is correct
            lastAnswerStatus = .correct
            
            // With each new letter it is harder to open the next one
            if correctAnswersCount == complexity + 1 {
                // New letter is opened
                complexity += 1
                correctAnswersCount = 0 // Resetting the correct answer count for this level
                correctAnswer = openedCharacters[complexity-1] // Introducing the new letter by force using it instead of randomizing
            } else {
                // No new letter is opened
                correctAnswersCount += 1
                
                // Making sure answers don't repeat
                if openedCharacters.count > 2 {
                    var newAnswerDiffers = false
                    while !newAnswerDiffers {
                        let newAnswer = openedCharacters.randomElement()! // New random value
                        if newAnswer.character != correctAnswer.character {
                            correctAnswer = newAnswer
                            newAnswerDiffers = true
                        }
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.play()
            }
        } else {
            //MARK: Answer is wrong
            
            lastAnswerStatus = .wrong
            withAnimation(Animation.default, {
                wrongAnswersCount += 1
            })
            
            // Error Haptic Feedback
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
        
        //MARK: Reset Values
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false, block: { timer in
            self.userAnswer = ""
            self.lastAnswerStatus = .none
        })
        timer.fireDate = .now + 0.75
    }
    
    func play() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: correctAnswer.character, ofType: "mp3")!)
        player = try! AVAudioPlayer(contentsOf: url)
        
        player.play()
    }
}

enum AnswerStatus {
    case correct
    case wrong
    case none
}
