//
//  File.swift
//  
//
//  Created by Alex Cucos on 01.04.2023.
//

import SwiftUI

struct Line: View {
    var body: some View {
        ZStack {
            Rectangle()
                .tint(.primary)
                .frame(width: 24, height: 6)
                .cornerRadius(3)
                .clipped()
        }
        
        .frame(width: 28, height: 24)
    }
}
