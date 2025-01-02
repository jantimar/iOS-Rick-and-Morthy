//
//  File.swift
//  Molecules
//
//  Created by Jan Timar on 02.01.2025.
//

import SwiftUI
import Style
import Atoms
import Locs

public struct ValueView: View {
    @Environment(\.style) private var style

    private let name: String
    private let value: String?

    private var formattedValue: String {
        guard let value = value, !value.isEmpty else {
            return "-"
        }
        return value
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 8) {
            TextView(name, type: .small)
                .foregroundStyle(style.colors.foregroundsSecondary)
                .frame(width: 90, alignment: .leading)

            TextView(formattedValue, type: .headline3)
                .foregroundStyle(style.colors.foregroundsPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    public init(_ name: String, _ value: String?) {
        self.name = name
        self.value = value
    }

    public init(_ key: LocKey, _ value: String?) {
        self.name = localize(key)
        self.value = value
    }
}
