//
//  File.swift
//  Organisms
//
//  Created by Jan Timar on 28.12.2024.
//

import SwiftUI
import Atoms
import Molecules
import Style

public enum CharacterCardType {
    case `default`, search
}

public struct CharacterCard: View {

    @Environment(\.style) private var style
    @Environment(\.colorScheme) private var colorScheme

    private let title: String?
    private let subtitle: String?
    private let image: URL?
    private let icon: IconType?
    private let isFavorite: Bool

    private let type: CharacterCardType

    public var body: some View {
        HStack(alignment: .top, spacing: style.offsets.extraLarge) {
            // Icon
            CachedImage(url: image)
                .frame(width: 44, height: 44)
                .cornerRadius(style.offsets.medium)

            // Content
            VStack(alignment: .leading, spacing: style.offsets.extraSmall) {
                HStack(alignment: .top, spacing: style.offsets.small) {
                    TextView(title, type: .headline3)
                        .foregroundStyle(style.colors.foregroundsPrimary)

                    if isFavorite {
                        Icon(.favorite(selected: true), size: .extraSmall, state: .selected)
                    }
                }

                TextView(subtitle, type: .small)
                    .foregroundStyle(style.colors.foregroundsSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if let icon = icon, type == .default {
                Icon(icon, state: .disabled)
                    .padding(.top, style.offsets.medium)
            }
        }
        .frame(minWidth: 0, minHeight: 0)
        .padding(.horizontal, style.offsets.medium)
        .padding(.vertical, verticalOffset)
        .background { backgroundColor }
        .cornerRadius(style.offsets.extraLarge)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.clear)
                .shadow(
                    color: type == .default ? .black.opacity(0.04) : .clear,
                    radius: 16,
                    x: 0,
                    y: 2
                )
        )
    }

    public init(
        title: String?,
        subtitle: String? = nil,
        image: URL? = nil,
        icon: IconType? = nil,
        isFavorite: Bool = false,
        type: CharacterCardType = .default
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.icon = icon
        self.isFavorite = isFavorite
        self.type = type
    }

    private var backgroundColor: Color {
        switch type {
        case .search: return .clear
        case .default:
            return colorScheme == .dark ? style.colors.backgroundsSecondary : style.colors.backgroundsTertiary
        }
    }

    private var verticalOffset: CGFloat {
        switch type {
        case .search: return style.offsets.small
        case .default: return style.offsets.large
        }
    }
}
