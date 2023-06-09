//
//  OnboardingView.swift
//  Learn Morse
//
//  Created by Alex Cucos on 01.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            if #available(iOS 16.0, *) {
                Text("Learn Morse!")
                    .font(.title.weight(.semibold))
                    .padding(.top, 48)
                    .padding(.bottom, 16)
                    .fontWidth(.expanded)
            } else {
                Text("Learn Morse!")
                    .font(.title.weight(.semibold))
                    .padding(.top, 48)
                    .padding(.bottom, 16)
            }
            Spacer()
            
            VStack(alignment: .center, spacing: 24) {
                OnboardingCell(symbol: "smallcircle.filled.circle",
                               title: "What is it?",
                               subtitle: "Morse is an alphabet that uses only dots and lines as a way of encoding letters and more.")
                OnboardingCell(symbol: "ellipsis.circle",
                               title: "Only dots and lines?",
                               subtitle: "Yes! In low-quality audio, words might sound vague. Morse brings clarity and precision.")
                OnboardingCell(symbol: "clock",
                               title: "Big history",
                               subtitle: "Invented in the 1830s, it has since been used for emergencies, military communication etc.")
                OnboardingCell(symbol: "questionmark.circle",
                               title: "Why learn it?",
                               subtitle: "Despite not being widely used anymore, Morse is a fun way to understand encoding and communication principles.")
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 8)
            
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Continue")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
            }
            .buttonStyle(OnboardingButton())
            
        }
        .frame(maxWidth: 600, maxHeight: 900, alignment: .center)
        .padding(36)
    }
}

struct OnboardingCell: View {
    @State var symbol: String
    @State var title: String
    @State var subtitle: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            Image(systemName: symbol)
                .foregroundColor(.blue)
                .font(.title.weight(.bold))
                .frame(width: 32, alignment: .center)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body.weight(.semibold))
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct OnboardingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Color.blue.opacity(0.7) : Color.blue)
            .animation(.interactiveSpring(), value: configuration.isPressed)
            .clipped()
            .cornerRadius(12, antialiased: true)
    }
}
