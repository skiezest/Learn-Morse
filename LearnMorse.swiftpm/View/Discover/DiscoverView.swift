//
//  DiscoverView.swift
//  Learn Morse
//
//  Created by Alex Cucos on 01.04.2023.
//

import SwiftUI
import AVKit

struct DiscoverView: View {
    @State var player: AVAudioPlayer?
    
    let columns = [
        GridItem(.adaptive(minimum: 200), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                Section {
                    ForEach(CharacterProvider.alphabetical, id: \.character) { character in
                        CharacterView(character: character, player: $player, isPlayerActive: true)
                            .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 32, style: .continuous))
                            .clipped()
                    }
                } header: {
                    HeaderView(text: "Letters")
                        .padding(.top, 8)
                }
                
                Section {
                    ForEach(CharacterProvider.numbers, id: \.character) { character in
                        CharacterView(character: character, player: $player, isPlayerActive: false)
                            .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 32, style: .continuous))
                            .clipped()
                    }
                } header: {
                    HeaderView(text: "Numbers")
                        .padding(.top, 12)
                }
                
                Section {
                    ForEach(CharacterProvider.punctuation, id: \.character) { character in
                        CharacterView(character: character, player: $player, isPlayerActive: false)
                            .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 32, style: .continuous))
                            .clipped()
                    }
                } header: {
                    HeaderView(text: "Punctuation")
                        .padding(.top, 12)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea(.all)
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitle(Text("Discover"), displayMode: .large)
    }
}

struct HeaderView: View {
    @State var text: String
    
    var body: some View {
        HStack {
            Text(text.uppercased())
                .padding(.horizontal, 16)
                .font(.body.weight(.semibold))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}
