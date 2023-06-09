//
//  ToastView.swift
//  
//
//  Created by Alex Cucos on 17.04.2023.
//

import SwiftUI
import AVKit

struct ToastView: View {
    @Binding var viewModel: ToastModel?
    
    @State private var timer: Timer?
    @State private var isShown = false
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: viewModel?.symbol ?? "checkmark.circle.fill")
                .font(.title3.weight(.heavy))
                .foregroundColor(.white)
            Text(viewModel?.text ?? "Nice!")
                .font(.body.weight(.heavy))
                .foregroundColor(.white)
        }
        .padding(12)
        .background(Color.black.opacity(0.75), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .offset(y: isShown ? 32 : -48)
        .opacity(isShown ? 1 : 0)
        .animation(.interpolatingSpring(mass: 0.04, stiffness: 10.0, damping: 0.7, initialVelocity: 8.0), value: isShown)
        .onChange(of: viewModel) { newValue in
            isShown = true
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false, block: { timer in
                isShown = false
            })
            guard let timer else { return }
            timer.fireDate = .now + 2
            RunLoop.main.add(timer, forMode: .default)
        }
    }
}


struct ToastModel: Equatable {
    var symbol: String
    var text: String
}

extension View {
    func toastView(toast: Binding<ToastModel?>) -> some View {
        self.modifier(ToastModifier(viewModel: toast))
    }
}
