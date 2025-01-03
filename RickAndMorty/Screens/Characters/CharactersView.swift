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
import Locs
import Molecules

struct CharactersView: View {

    @Environment(\.style) private var style
    @State private var isSearching: Bool = false
    @State var viewModel: CharactersViewModel

    var body: some View {
        GeometryReader { reader in
            TableView(
                header: {
                    SearchBar(
                        placeholder: localize(.charactersSearchPlaceholder),
                        search: viewModel.search.binding,
                        isSearching: { isSearching = $0 }
                    )
                },
                content: {
                    switch viewModel.characters {
                    case let .failure(text, isRetryEnabled):
                        ErrorView(
                            text: text,
                            action: isRetryEnabled ? viewModel.refresh : nil
                        )
                        .frame(height: reader.size.height - style.offsets.extraExtraLarge - style.offsets.extraLarge)
                    case let .data(charactes),
                        let .refreshing(charactes):
                        ForEach(charactes) { character in
                            Button(
                                action: { viewModel.router.push(.character(character)) },
                                label: {
                                    CharacterCard(
                                        title: character.name ?? "-",
                                        subtitle: character.status?.localized,
                                        image: character.image,
                                        icon: .arrowRight,
                                        isFavorite: isSearching ? false : viewModel.isFavorite(character: character),
                                        type: isSearching ? .search : .default
                                    )
                                }
                            )
                        }
                    case .loading:
                        ActivityIndicator()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    default:
                        Color.clear
                    }
                },
                footer: footer
            )
            .environment(\.isSearchBarActive, isSearching)
            .refreshable { viewModel.refresh() }
            .padding(.horizontal, style.offsets.extraLarge)
        }
        .padding(.bottom)
        .padding(.top, isSearching ? style.offsets.small : 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: viewModel.refreshFavorites)
        .navigationTitle(localize(.charactersTitle))
        .toolbar(isSearching ? .hidden : .automatic, for: .navigationBar)
        .background(style.colors.backgroundsPrimary)
        .animation(.easeIn, value: viewModel.characters)
    }

    @ViewBuilder
    private func footer() -> some View {
        if viewModel.characters.isRefreshing {
            HStack {
                ActivityIndicator()
                Spacer()
            }
            .padding(.horizontal, style.offsets.large * 2)
            .padding(.bottom, style.offsets.large * 4)
        } else if viewModel.characters.data != nil {
            Spacer(minLength: style.offsets.large * 4 + 42)
                .onAppear(perform: { viewModel.fetchNextPage() })
        }
    }
}

extension Character: @retroactive Identifiable { }
