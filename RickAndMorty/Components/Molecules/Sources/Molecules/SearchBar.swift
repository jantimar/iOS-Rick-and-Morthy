//
//  File.swift
//  Molecules
//
//  Created by Jan Timar on 02.01.2025.
//

import SwiftUI
import Atoms
import Style
import Locs

public extension EnvironmentValues {
    @Entry var isSearchBarActive: Bool = false
}

public struct SearchBar: View {
    @Environment(\.style) private var style
    @FocusState private var isFocused: Bool

    private var placeholder: String
    private var search: Binding<String>
    private var isSearching: (Bool) -> Void

    public var body: some View {
        HStack(spacing: style.offsets.medium) {
            HStack(spacing: style.offsets.medium) {
                Icon(.search, state: .default)

                TextField(
                    "",
                    text: search,
                    prompt: Text(placeholder)
                        .foregroundStyle(style.colors.foregroundsSecondary)
                        .font(style.fonts.medium)
                )
                .focused($isFocused)
                .frame(maxWidth: .infinity)
                .font(style.fonts.medium)
                .autocorrectionDisabled()

                if !search.wrappedValue.isEmpty {
                    Button(
                        action: { search.wrappedValue = "" },
                        label: { Icon(.close2, size: .extraSmall, state: .default) }
                    )
                }
            }
            .padding(.horizontal, style.offsets.medium)
            .frame(height: style.offsets.extraExtraLarge)
            .background(
                Capsule()
                    .fill(style.colors.backgroundsSecondary)
            )

            if isFocused || !search.wrappedValue.isEmpty {
                Button(
                    action: {
                        isFocused = false
                        isSearching(false)
                        search.wrappedValue = ""
                    },
                    label: {
                        TextView(.cancel, type: .medium)
                            .foregroundStyle(style.colors.foregroundsPrimary)
                            .foregroundStyle(style.colors.accentPrimary)
                    })
            }
        }
        .onChange(of: isFocused) { _, value in
            // Send value on change focus to true, or to false with empty search
            guard value || search.wrappedValue.isEmpty else { return }
            isSearching(value)
        }
        .animation(.linear(duration: 0.2), value: isFocused)
    }

    public init(
        placeholder: String = "",
        search: Binding<String>,
        isSearching: @escaping (Bool) -> Void
    ) {
        self.placeholder = placeholder
        self.search = search
        self.isSearching = isSearching
    }
}
