//
//  DiscoverView.swift
//  
//
//  Created by Alex Cucos on 04.04.2023.
//

import SwiftUI

struct TypeView: View {
    @StateObject var viewModel = TypeViewModel()
    @Namespace var animation
    
    @State var stackOpacity = 1.0
    @Binding var showsHelp: Bool
    
    @State var isHintShown = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                VStack(spacing: 24) {
                    Text("Type the following:")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.secondary)
                    
                    HStack(alignment: .center, spacing: 16) {
                        ForEach(viewModel.currentLevel.indices, id: \.self) { index in
                            LetterView(viewModel: viewModel, index: index, wrongAnswers: $viewModel.wrongAnswers, backgroundAnimation: animation)
                                
                        }
                    }
                    .opacity(stackOpacity)
                    .onChange(of: viewModel.levelsCompleted) { _ in
                        withAnimation(.easeInOut) {
                            stackOpacity = 0
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            withAnimation(.easeInOut(duration: 0.24)) {
                                stackOpacity = 1
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color(.systemGroupedBackground))
            .overlay(alignment: .bottom) {
                HintView(character: $viewModel.currentHint, isShown: $isHintShown)
            }
            
            VStack(alignment: .center) {
                Spacer()
                HStack(alignment: .center, spacing: 20) {
                    ForEach(viewModel.context, id: \.self) { morse in
                        switch morse {
                        case .dot:
                            Dot()
                                .transition(.scale.animation(.interactiveSpring()))
                        case .line:
                            Line()
                                .transition(.scale.animation(.interactiveSpring()))
                        }
                    }
                }
                .frame(height: 40)
                Spacer()
                MorseKeyboardView(context: $viewModel.context)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .overlay {
            ZStack {
                ToolbarView(handleHint: {
                    viewModel.updateHint()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isHintShown.toggle()
                    }
                }, showsHelp: $showsHelp)
            }
        }
        .toastView(toast: $viewModel.toast)
    }
}

struct LetterView: View {
    @ObservedObject var viewModel: TypeViewModel
    var isActive: Bool {
        viewModel.currentLevelProgress == index
    }
    let index: Int
    @Binding var wrongAnswers: Int
    var backgroundAnimation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .center) {
            if isActive {
                RoundedRectangle(cornerRadius: 36, style: .continuous)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Color.blue.opacity(0.1))
                    .matchedGeometryEffect(id: "LetterView", in: backgroundAnimation)
            }
            
            Text(viewModel.currentLevel[index].character)
                .frame(width: 120, height: 120, alignment: .center)
                .font(.system(size: 80, weight: .semibold, design: .rounded))
                .foregroundColor(isActive ? .blue : .primary)
                .transition(.opacity)
        }
        .frame(width: 120, height: 120, alignment: .center)
    }
}

//MARK: - Toolbar
private struct ToolbarView: View {
    @State var handleHint: () -> Void
    @Binding var showsHelp: Bool
    
    init(handleHint: @escaping () -> Void, showsHelp: Binding<Bool>) {
        self.handleHint = handleHint
        _showsHelp = showsHelp
    }
    
    var body: some View {
        HStack(spacing: 24) {
            Button {
                showsHelp = true
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.blue)
            }
            
            Button {
                withAnimation(.interactiveSpring()) {
                    handleHint()
                }
            } label: {
                Image(systemName: "lightbulb")
                    .font(.system(size: 22, weight: .bold))
                // Apple, please make SF Symbols more consistent!!!
                    .foregroundColor(.blue)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(28)
    }
}

//MARK: - Hint
private struct HintView: View {
    @Binding var character: Character?
    @Binding var isShown: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("\(character?.character ?? "This character") is written as:")
                .font(.body.weight(.medium))
                .foregroundColor(.gray)
            
            HStack(alignment: .center, spacing: 4) {
                if let character {
                    ForEach(character.morse, id: \.self) { morse in
                        if morse == .dot {
                            Dot()
                        } else {
                            Line()
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 40)
            .frame(minWidth: 40)
            .background(Color(.systemBackground))
            .mask(Capsule())
        }
        .padding(.bottom, 32)
        .opacity(isShown ? 1 : 0)
        .offset(y: isShown ? 0 : 12)
        .animation(.easeInOut, value: isShown)
        .onChange(of: character) { newValue in
            isShown = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isShown = false
            }
        }
        .onAppear() {
            isShown = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isShown = false
            }
        }
    }
}
