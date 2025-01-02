//
//  File.swift
//  Templates
//
//  Created by Jan Timar on 01.01.2025.
//

import SwiftUI

public struct TableView<T: Identifiable, Cell: View, Footer: View>: View {

    @Environment(\.style) private var style
    @Environment(\.isSearching) private var isSearching
    private var items: [T]
    private var footer: Footer
    private var cell: (T, Bool) -> Cell
    private var action: (T) -> Void

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: style.offsets.extraLarge) {
                ForEach(items) { item in
                    Button(
                        action: { action(item) },
                        label: { cell(item, isSearching) }
                    )
                }
                
                footer
            }
            .animation(.default, value: isSearching)
        }
    }

    public init(
        items: [T],
        cell: @escaping (T, Bool) -> Cell,
        @ViewBuilder footer: () -> Footer,
        action: @escaping (T) -> Void
    ) {
        self.items = items
        self.footer = footer()
        self.action = action
        self.cell = cell
    }
}
