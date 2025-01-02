//
//  ErrorView.swift
//  Templates
//
//  Created by Jan Timar on 02.01.2025.
//

import SwiftUI
import Style
import Atoms
import Locs

public struct ErrorView: View {
    @Environment(\.style) private var style

    private let text: String
    private let action: (() -> Void)?

    public var body: some View {
        VStack(alignment: .center, spacing: style.offsets.medium) {
            TextView(text, type: .large)
                .foregroundStyle(style.colors.foregroundsTertiary)

            if let action = action {
                Button(action: action) {
                    TextView(.errorRetry, type: .large)
                        .foregroundStyle(style.colors.accentPrimary)
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    public init(
        text: String,
        action: (() -> Void)? = nil
    ) {
        self.text = text
        self.action = action
    }
}
