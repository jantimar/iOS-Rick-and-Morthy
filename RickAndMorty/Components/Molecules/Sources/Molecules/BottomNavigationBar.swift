//
//  File.swift
//  Molecules
//
//  Created by Jan Timar on 28.12.2024.
//

import SwiftUI
import Atoms
import Style

public protocol BottomBarButtonProtocol: Equatable, Identifiable {
    var icon: IconType { get }
}

public struct BottomNavigationBar<BarButton: BottomBarButtonProtocol>: View {

    @Environment(\.style) private var style

    private let buttons: [BarButton]
    private let selected: BarButton?
    private let action: (BarButton) -> Void

    public var body: some View {
        HStack(spacing: style.offsets.extraExtraLarge) {
            ForEach(buttons) { button in
                Button(
                    action: { action(button) },
                    label: {
                        Icon(
                            button.icon,
                            size: .large,
                            state: button == selected ? .selected : .disabled
                        )
                    }
                    )
            }
        }
        .padding(.horizontal, style.offsets.extraExtraLarge)
        .padding(.vertical, style.offsets.large)
        .background(style.colors.backgroundsBottomNavigation)
        .clipShape(.capsule)
    }

    public init(
        buttons: [BarButton],
        selected: BarButton? = nil,
        action: @escaping (BarButton) -> Void
    ) {
        self.buttons = buttons
        self.selected = selected
        self.action = action
    }
}
