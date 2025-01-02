//
//  File.swift
//  Templates
//
//  Created by Jan Timar on 02.01.2025.
//

import SwiftUI
import Style
import Molecules

public struct TableView<Content: View, Header: View, Footer: View>: View {

    @Environment(\.style) private var style
    @Environment(\.isSearchBarActive) private var isSearching

    private var header: Header
    private var content: Content
    private var footer: Footer

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: style.offsets.extraLarge) {
                header

                content

                footer
            }
            .animation(.default, value: isSearching)
        }
    }

    public init(
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer
    ) {
        self.header = header()
        self.content = content()
        self.footer = footer()
    }
}
