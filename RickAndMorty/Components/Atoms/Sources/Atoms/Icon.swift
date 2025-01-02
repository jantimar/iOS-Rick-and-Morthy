//
//  File.swift
//  Atoms
//
//  Created by Jan Timar on 28.12.2024.
//

import SwiftUI
import Style

public enum IconSize: String {
    /// 16 x 16
    case extraSmall = "_xs"
    /// 24 x 24
    case small = "_s"
    /// 32 x 32
    case medium = ""
    /// 42 x 42
    case large = "_l"
}

public enum IconType {
    case characters
    case favorite(selected: Bool = false)
    case arrowRight
    case arrowLeft
    case search
    /// X
    case close
    /// X in circle
    case close2

    var name: String {
        switch self {
        case .characters:
            return "characters"
        case let .favorite(selected):
            return "favorite" + (selected ? "_full" : "")
        case .arrowRight:
            return "arrowRight"
        case .arrowLeft:
            return "arrowLeft"
        case .search:
            return "search"
        case .close:
            return "close"
        case .close2:
            return "close2"
        }
    }
}

public enum IconState {
    case `default`, selected, disabled
}

public struct Icon: View {

    @Environment(\.style) private var style
    private let iconName: String
    private let state: IconState

    private var color: Color {
        switch state {
        case .default:
            return style.colors.iconsPrimary
        case .selected:
            return style.colors.iconsTertiary
        case .disabled:
            return style.colors.iconsSecondary
        }
    }

    public var body: some View {
        Image(iconName)
            .renderingMode(.template)
            .foregroundStyle(color)
    }

    public init(
        _ type: IconType,
        size: IconSize = .small,
        state: IconState = .default
    ) {
        self.iconName = type.name + size.rawValue
        self.state = state
    }
}

extension UIImage {
    convenience public init?(
        _ type: IconType,
        size: IconSize = .small
    ) {
        let name = type.name + size.rawValue
        self.init(named: name)
    }
}
