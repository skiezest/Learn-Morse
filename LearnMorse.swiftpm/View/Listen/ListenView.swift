//
//  ListenView.swift
//  Learn Morse
//
//  Created by Alex Cucos on 01.04.2023.
//

import SwiftUI
import AVKit

struct ListenView: View {
    @StateObject var viewModel = ListenViewModel()
    
    @State var isPopoverShown = false
    @State var fieldColor = Color.blue
    
    @State var isPlaying = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            VStack(alignment: .center, spacing: 52) {
                HStack(alignment: .center, spacing: 32) {
                    Button {
                        viewModel.play()
                        withAnimation(.easeInOut) {
                            isPlaying = true
                        }
                    } label: {
                        SpeakerView(isPlaying: $isPlaying)
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(PlayButtonStyle())
                    
                    
                    if #available(iOS 16, *) {
                        Text("What letter do you hear?")
                            .font(.title.weight(.semibold))
                            .fontWidth(.expanded)
                    } else {
                        Text("What letter do you hear?")
                            .font(.title.weight(.semibold))
                    }
                }
                
                ListenViewField(fieldColor: $fieldColor, userAnswer: $viewModel.userAnswer, wrongAnswersCount: $viewModel.wrongAnswersCount)
                LetterKeyboardView(context: $viewModel.userAnswer, currentComplexity: $viewModel.complexity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay(content: {
            ToolbarView(correctAnswer: $viewModel.correctAnswer, isPopoverShown: $isPopoverShown)
        })
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                self.viewModel.play()
            }
        }
        .onReceive(viewModel.$lastAnswerStatus) { answer in
            switch answer {
            case .correct:
                fieldColor = .green
            case .wrong:
                fieldColor = .red
            default:
                fieldColor = Color(.systemGray3)
            }
        }
        .toastView(toast: $viewModel.toast)
    }
}

//MARK: - Input Field
struct ListenViewField: View {
    @Binding var fieldColor: Color
    @Binding var userAnswer: String
    @Binding var wrongAnswersCount: Int

    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Text(userAnswer.isEmpty ? " " : userAnswer)
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .foregroundColor(fieldColor)
                    .frame(width: 32, alignment: .center)
                    .scaleEffect(userAnswer.isEmpty ? 0 : 1, anchor: .center)
                    .opacity(userAnswer.isEmpty ? 0 : 1)
                    .animation(Animation.interpolatingSpring(mass: 0.03, stiffness: 20.0, damping: 0.9, initialVelocity: 4.8), value: userAnswer.isEmpty)
            }
            .animation(.easeInOut(duration: 0.15), value: userAnswer)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(minWidth: 56, minHeight: 64, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(20, antialiased: true)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(fieldColor, lineWidth: (5))
        )
        .animation(.easeInOut(duration: 0.15), value: fieldColor)
        .modifier(ShakeEffect(animatableData: CGFloat(wrongAnswersCount)))
    }
}

//MARK: - Popover
private struct ToolbarView: View {
    @Binding var correctAnswer: Character
    @Binding var isPopoverShown: Bool
    
    var body: some View {
        ZStack {
            Button {
                isPopoverShown.toggle()
            } label: {
                Image(systemName: "lightbulb")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.blue)
            }
            .padding(28)
            .popover(isPresented: $isPopoverShown) {
                CharacterView(character: correctAnswer, player: .constant(nil), isPlayerActive: false)
                    .frame(minWidth: 160, minHeight: 200, alignment: .center)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}

//MARK: - Play Button
struct PlayButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 80, height: 80, alignment: .center)
            .tint(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
            .background(configuration.isPressed ? Color.blue.opacity(0.05) : Color.blue.opacity(0.1))
            .animation(.interactiveSpring(), value: configuration.isPressed)
            .clipped()
            .cornerRadius(28, antialiased: true)
    }
}
