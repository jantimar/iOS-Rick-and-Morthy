//
//  FavoritesView.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import SwiftUI
import Models
import Style
import Atoms
import Templates
import Organisms
import Locs

struct FavoritesView: View {
    @Environment(\.style) private var style
    @State var viewModel: FavoritesViewModel

    var body: some View {
        ZStack {
            switch viewModel.characters {
            case let .failure(text, _):
                ErrorView(text: text)
            case let .data(charactes),
                    let .refreshing(charactes):
                TableView(
                    items: charactes,
                    cell: { character, _ in
                        CharacterCard(
                            title: character.name ?? "-",
                            subtitle: character.status?.localized,
                            image: character.image,
                            icon: .arrowRight,
                            isFavorite: true,
                            type: .default
                        )
                    },
                    footer: {
                        Spacer(minLength: style.offsets.large * 4 + 42)
                    },
                    action: { character in
                        viewModel.router.push(.character(character))
                    }
                )
                .padding(.horizontal, style.offsets.extraLarge)

            case .loading:
                ActivityIndicator()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            default:
                Color.clear
            }
        }
        .onAppear(perform: viewModel.update)
        .navigationTitle(localize(.favoritesTitle))
        .background(style.colors.backgroundsPrimary)
        .animation(.easeIn, value: viewModel.characters)
    }
}
