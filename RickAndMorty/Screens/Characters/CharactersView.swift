//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import SwiftUI

struct CharactersView: View {

    @Environment(\.style) private var style
    @State var viewModel: CharactersViewModel

    var body: some View {
        Color.blue
            .navigationTitle("Characters")
    }
}
