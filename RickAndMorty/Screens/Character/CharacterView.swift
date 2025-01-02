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

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: style.offsets.extraLarge) {
                HStack(alignment: .top, spacing: style.offsets.extraLarge) {
                    CachedImage(url: viewModel.character.image)
                        .frame(width: 140, height: 140)
                        .cornerRadius(style.offsets.medium)

                    VStack(alignment: .leading, spacing: style.offsets.extraLarge) {
                        TextView("Name", type: .medium)
                            .foregroundStyle(style.colors.foregroundsSecondary)

                        TextView(viewModel.character.name, type: .headline2)
                            .foregroundStyle(style.colors.foregroundsPrimary)
                    }
                    .frame(maxWidth: .infinity)

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

                ValueView("Status", viewModel.character.status?.rawValue)
                ValueView("Species", viewModel.character.species)
                ValueView("Type", viewModel.character.type)
                ValueView("Gender", viewModel.character.gender?.rawValue)
                ValueView("Origin", viewModel.character.origin?.name)
                ValueView("Location", viewModel.character.location?.name)
            }
            .padding(16)
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
            .padding(16)
        }
        .background(style.colors.backgroundsPrimary)
        .onAppear(perform: viewModel.update)
    }
}
