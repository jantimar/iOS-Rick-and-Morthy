//
//  CharactersView.swift
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

struct CharactersView: View {

    @Environment(\.style) private var style
    @State var viewModel: CharactersViewModel

    var body: some View {
        ZStack {
            switch viewModel.characters {
            case let .failure(text):
                TextView(text, type: .large)
                    .foregroundStyle(style.colors.foregroundsTertiary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

            case let .data(charactes),
                    let .refreshing(charactes):
                TableView(
                    items: charactes,
                    cell: { character, isSearching in
                        CharacterCard(
                            title: character.name ?? "-",
                            subtitle: character.status?.rawValue,
                            image: character.image,
                            icon: .arrowRight,
                            isFavorite: isSearching ? false : viewModel.isFavorite(character: character),
                            type: isSearching ? .search : .default
                        )
                    },
                    footer: {
                        if viewModel.characters.isRefreshing {
                            HStack {
                                ActivityIndicator()
                                Spacer()
                            }
                            .padding(.horizontal, style.offsets.large * 2)
                            .padding(.bottom, style.offsets.large * 4)
                        } else {
                            Spacer(minLength: style.offsets.large * 4 + 42)
                                .onAppear(perform: viewModel.fetchNextPage)
                        }
                    },
                    action: { character in
                        viewModel.router.push(.character(character))
                    }
                )
                .refreshable { viewModel.refresh() }
                .padding(.horizontal, style.offsets.extraLarge)
            case .loading:
                ActivityIndicator()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            default:
                Color.clear
            }
        }
        .onAppear(perform: viewModel.refreshFavorites)
        .navigationTitle("Characters")
        .searchable(
            text: viewModel.search.binding,
            placement: .navigationBarDrawer,
            prompt: "Search character"
        )
        .background(style.colors.backgroundsPrimary)
        .animation(.easeIn, value: viewModel.characters)
    }
}

extension Character: Identifiable { }
