//
//  TabBarView.swift
//  Templates
//
//  Created by Jan Timar on 29.12.2024.
//

import SwiftUI
import Molecules
import Style
import Atoms

public struct TabBarView<Tab: BottomBarButtonProtocol, Content: View>: View {

    @Environment(\.style) private var style

    @ViewBuilder private var content: (Tab) -> Content
    @State private var selected: Tab?
    private let tabs: [Tab]

    public var body: some View {
        ZStack(alignment: .bottom) {

            if let tab = selected ?? tabs.first {
                content(tab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            BottomNavigationBar(
                buttons: tabs,
                selected: selected,
                action: { selected = $0 }
            )
            .padding(.bottom, style.offsets.extraExtraLarge)
        }
        .animation(.easeInOut(duration: 0.25), value: selected)
    }

    public init(
        tabs: [Tab],
        @ViewBuilder content: @escaping (Tab) -> Content
    ) {
        self.selected = tabs.first
        self.tabs = tabs
        self.content = content
    }
}
