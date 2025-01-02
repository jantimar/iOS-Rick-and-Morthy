//
//  File.swift
//  Atoms
//
//  Created by Jan Timar on 01.01.2025.
//

import SwiftUI

public struct ActivityIndicator: View {
    @Environment(\.style) private var style

    public var body: some View {
        ProgressView()
            .tint(style.colors.foregroundsPrimary)
    }

    public init() { }
}
