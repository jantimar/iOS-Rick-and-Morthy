//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import SwiftUI
import Style
import Atoms
import Molecules
import Models

struct CharacterView: View {
    @Environment(\.style) private var style
    @State var viewModel: CharacterViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: style.offsets.extraLarge) {
                HStack(alignment: .top, spacing: style.offsets.extraLarge) {
                    CachedImage(url: viewModel.character.image)
                        .frame(width: 140, height: 140)
                        .cornerRadius(style.offsets.medium)

                    VStack(alignment: .leading, spacing: style.offsets.extraLarge) {
                        TextView(.characterName, type: .medium)
                            .foregroundStyle(style.colors.foregroundsSecondary)

                        TextView(viewModel.character.name, type: .headline2)
                            .foregroundStyle(style.colors.foregroundsPrimary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    if let isFavorite = viewModel.isFavorite {
                        Button(
                            action: viewModel.toggleFavorite,
                            label: {
                                Icon(
                                    .favorite(selected: isFavorite),
                                    size: .medium,
                                    state: isFavorite ? .selected : .disabled
                                )
                            }
                        )
                        .animation(.easeIn, value: viewModel.isFavorite == true)
                    }
                }

                Separator()

                // Portrait iPhone
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    infoSection1()
                    infoSection2()
                } else {
                    // Landscape iPhone, iPad any
                    HStack(alignment: .top, spacing: 0) {
                        VStack(alignment: .leading, spacing: style.offsets.extraLarge, content: infoSection1)
                        VStack(alignment: .leading, spacing: style.offsets.extraLarge, content: infoSection2)
                    }

                }
            }
            .padding(style.offsets.extraLarge)
            .background(style.colors.backgroundsTertiary)
            .clipShape(.rect(cornerRadius: style.offsets.extraLarge))
            .background(
                RoundedRectangle(cornerRadius: style.offsets.extraLarge)
                    .shadow(
                        color: .black.opacity(0.08),
                        radius: style.offsets.extraLarge,
                        x: 0,
                        y: 2
                    )
            )
            .padding(style.offsets.extraLarge)
        }
        .background(style.colors.backgroundsPrimary)
        .onAppear(perform: viewModel.update)
    }

    @ViewBuilder
    private func infoSection1() -> some View {
        ValueView(.characterStatus, viewModel.character.status?.localized)
        ValueView(.characterSpecies, viewModel.character.species)
        ValueView(.characterType, viewModel.character.type)
    }

    @ViewBuilder
    private func infoSection2() -> some View {
        ValueView(.characterGender, viewModel.character.gender?.localized)
        ValueView(.characterOrigin, viewModel.character.origin?.name)
        ValueView(.characterLocation, viewModel.character.location?.name)
    }
}
