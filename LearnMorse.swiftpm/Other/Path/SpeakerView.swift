//
//  SpeakerView.swift
//  
//
//  Created by Alex Cucos on 17.04.2023.
//

import SwiftUI

struct SpeakerView: View {
    @State var rotation: CGFloat = 0
    @Binding var isPlaying: Bool
    
    var body: some View {
        Speaker()
            .rotation(.degrees(rotation))
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
    }
}
