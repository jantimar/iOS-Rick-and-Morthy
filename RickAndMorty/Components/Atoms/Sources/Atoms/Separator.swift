//
//  File.swift
//  Atoms
//
//  Created by Jan Timar on 02.01.2025.
//

import SwiftUI
import Style

public struct Separator: View {
    @Environment(\.style) private var style

    public var body: some View {
        style.colors.foregroundsSeparator
            .frame(height: 1)
            .frame(maxWidth: .infinity)
    }

    public init() { }
}
