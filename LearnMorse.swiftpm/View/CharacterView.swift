//
//  CharacterView.swift
//  
//
//  Created by Alex Cucos on 02.04.2023.
//

import SwiftUI
import AVKit

struct CharacterView: View {
    @State var character: Character
    @Binding var player: AVAudioPlayer?
    @State var isPlayerActive: Bool
    
    @State private var isPlaying = false
    
    var body: some View {
        ZStack {
            ZStack {
                Button {
                    if isPlayerActive, let bundle = Bundle.main.path(forResource: character.character, ofType: "mp3") {
                        let url = URL(fileURLWithPath: bundle)
                        player = try? AVAudioPlayer(contentsOf: url)
                    }
                    
                    isPlaying = true
                    player?.play()
                } label: {
                    SpeakerView(isPlaying: $isPlaying)
                        .foregroundColor(Color.blue)
                        .frame(width: 28, height: 28)
                        .opacity(isPlayerActive ? 1 : 0)
                }
                .padding(20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            VStack(spacing: 16) {
                Text(character.character)
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                
                VStack(spacing: 12) {
                    HStack(alignment: .center, spacing: 4) {
                        ForEach(character.morse, id: \.self) { morse in
                            if morse == .dot {
                                Dot()
                            } else {
                                Line()
                            }
                        }
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .frame(height: 28)
                    .background(Color(.secondarySystemBackground))
                    .mask(Capsule())
                    
                    if let word = character.word?.uppercased() {
                        Text(word)
                            .font(.body.weight(.semibold))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
    }
}
