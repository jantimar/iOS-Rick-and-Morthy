//
//  File.swift
//  Atoms
//
//  Created by Jan Timar on 28.12.2024.
//

import SwiftUI
import Style

public enum TextType {
    case headline1
    case headline2
    case headline3
    case large
    case medium
    case small
    case bottomNavigation

    fileprivate func font(style: StyleFonts) -> Font {
        switch self {
        case .headline1:
            return style.headline1
        case .headline2:
            return style.headline2
        case .headline3:
            return style.headline3
        case .large:
            return style.large
        case .medium:
            return style.medium
        case .small:
            return style.small
        case .bottomNavigation:
            return style.bottomNavigation
        }
    }
}

public struct TextView: View {

    @Environment(\.style) private var style

    private var text: String
    private var type: TextType

    public var body: some View {
        Text(text)
            .font(type.font(style: style.fonts))
            .lineLimit(0)
    }

    public init(
        _ text: String,
        type: TextType = .medium
    ) {
        self.text = text
        self.type = type
    }
}
