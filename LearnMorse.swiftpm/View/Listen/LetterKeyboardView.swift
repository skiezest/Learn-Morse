//
//  File.swift
//  
//
//  Created by Alex Cucos on 02.04.2023.
//

import SwiftUI

struct LetterKeyboardView: View {
    @Binding var context: String
    @Binding var currentComplexity: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ForEach(Keyboard.keys, id: \.self) { row in
                HStack(alignment: .center, spacing: 12) {
                    Spacer()
                    ForEach(row, id: \.self) { key in
                        LetterKeyboardKey(label: {
                            Text(key)
                        }, action: {
                            context = key
                        }, currentComplexity: $currentComplexity, key: key)
                    }
                    Spacer()
                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
    }
}

struct LetterKeyboardKey<Label: View>: View {
    private let label: () -> Label
    private let action: () -> ()
    @Binding var currentComplexity: Int
    var key: String
    
    @State private var pressed: Bool = false
    private var isActive: Bool {
        return (CharacterProvider.byDifficulty.prefix(currentComplexity).contains(where: { character in
            character.character == key
        }))
    }
    
    init(label: @escaping () -> Label, action: @escaping () -> (), currentComplexity: Binding<Int>, key: String) {
        self.label = label
        self.action = action
        self._currentComplexity = currentComplexity
        self.key = key
    }
    
    var body: some View {
        HStack {
            label()
                .font(.largeTitle.weight(.semibold))
                .foregroundColor(isActive ? Color.primary : Color.primary.opacity(0.25))
        }
        .frame(maxWidth: 60, minHeight: 60, maxHeight: 76)
        
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
            .foregroundColor(isActive ? (pressed ? Color(.systemBackground).opacity(0.5) : Color(.systemBackground)) : Color(.systemBackground).opacity(0.35)))
        .scaleEffect(pressed ? 0.93 : 1)
        
        .animation(.interactiveSpring(), value: isActive)
        .animation(.interactiveSpring(), value: pressed)
        
        .onTapGesture {
            if isActive {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                action()
            }
        }
        .simultaneousGesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if isActive {
                    self.pressed = true
                }
            }
            .onEnded { _ in
                if isActive {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.pressed = false
                    }
                }
            })
    }
}
