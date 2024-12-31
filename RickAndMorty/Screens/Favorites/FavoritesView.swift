//
//  FavoritesView.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import SwiftUI
import Style

struct FavoritesView: View {

    @Environment(\.style) private var style
    @State var viewModel: FavoritesViewModel

    var body: some View {
        Color.red
            .navigationTitle("Favorites")
    }
}
