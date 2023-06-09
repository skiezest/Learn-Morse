//
//  Dot.swift
//  Learn Morse
//
//  Created by Alex Cucos on 01.04.2023.
//

import SwiftUI

struct Dot: View {
    var body: some View {
        ZStack {
            Circle()
                .tint(.primary)
                .frame(width: 8, height: 8)
        }
        .frame(width: 12, height: 24)
    }
}
