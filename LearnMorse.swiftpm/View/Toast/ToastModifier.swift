//
//  File.swift
//  
//
//  Created by Alex Cucos on 17.04.2023.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var viewModel: ToastModel?
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                VStack {
                    ToastView(viewModel: $viewModel)
                    Spacer()
                }
            }
    }
}
