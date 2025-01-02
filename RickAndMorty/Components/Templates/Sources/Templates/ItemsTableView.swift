//
//  File.swift
//  Templates
//
//  Created by Jan Timar on 01.01.2025.
//

import SwiftUI
import Style
import Molecules

public struct ItemsTableView<T: Identifiable, Cell: View, Header: View, Footer: View>: View {

    @Environment(\.style) private var style
    @Environment(\.isSearchBarActive) private var isSearching

    private var items: [T]
    private var footer: Footer
    private var header: Header?
    private var cell: (T, Bool) -> Cell
    private var action: (T) -> Void

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: style.offsets.extraLarge) {
                if let header = header {
                    header
                }

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
        @ViewBuilder header: () -> Header?,
        @ViewBuilder footer: () -> Footer,
        action: @escaping (T) -> Void
    ) {
        self.items = items
        self.header = header()
        self.footer = footer()
        self.action = action
        self.cell = cell
    }
}

extension ItemsTableView where Header == EmptyView {
    public init(
        items: [T],
        cell: @escaping (T, Bool) -> Cell,
        @ViewBuilder footer: () -> Footer,
        action: @escaping (T) -> Void
    ) {
        self.items = items
        self.header = nil
        self.footer = footer()
        self.action = action
        self.cell = cell
    }
}
