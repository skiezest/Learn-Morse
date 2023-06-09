//
//  MorseKeyboardView.swift
//  
//
//  Created by Alex Cucos on 04.04.2023.
//

import SwiftUI
import AVKit

struct MorseKeyboardView: View {
    @Binding var context: [Morse]
    @State private var sounds: [AVAudioPlayer] = []
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            MorseKeyboardKey("Dot") {
                context.append(.dot)
                addSound("dot")
            } label: {
                Dot()
            }
            
            MorseKeyboardKey ("Line") {
                context.append(.line)
                addSound("line")
            } label: {
                Line()
            }
        }
    }
    
    func addSound(_ name: String) {
        if let url = Bundle.main.url(forResource: name, withExtension: "mp3") {
            guard let player = try? AVAudioPlayer(contentsOf: url) else { return }
            if sounds.allSatisfy({ $0.isPlaying == false }) {
                playSound(player, withDelay: nil)
            } else {
                playSound(player, withDelay: 0.2)
            }
        }
    }
    
    func playSound(_ player: AVAudioPlayer, withDelay delay: Double?) {
        if let delay = delay {
            sounds.append(player)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                player.play()
                sounds.removeFirst()
            }
        } else {
            sounds.append(player)
            sounds.last?.play()
        }
    }
}


struct MorseKeyboardKey<Label: View>: View {
    @State var subtitle: String
    
    private let action: () -> ()
    private let label: () -> Label
    
    init(_ subtitle: String, action: @escaping () -> (), label: @escaping () -> Label) {
        self.subtitle = subtitle
        self.action = action
        self.label = label
    }
    
    @State private var pressed: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                label()
                    .scaleEffect(1.25)
                    .frame(minWidth: 80, maxWidth: 208, minHeight: 80, maxHeight: 156, alignment: .center)
                    .foregroundColor(pressed ? .blue.opacity(0.25) : .blue)
            }
            .frame(minWidth: 80, maxWidth: 208, minHeight: 80, maxHeight: 156, alignment: .center)
            .background(pressed ? Color(.systemGroupedBackground).opacity(0.75) : Color(.systemGroupedBackground), in: RoundedRectangle(cornerRadius: 44, style: .continuous))
            
            .scaleEffect(pressed ? 0.95 : 1)
            .animation(.interactiveSpring(), value: pressed)
            
            Text(subtitle)
                .font(.body.weight(.semibold))
                .foregroundColor(Color(.systemGray2))
        }
        
        .onTapGesture {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            withAnimation {
                action()
            }
        }

        .simultaneousGesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in
                self.pressed = true
            }
            .onEnded { _ in
                self.pressed = false
            })
    }
}
