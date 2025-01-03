//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Jan Timar on 27.12.2024.
//

import SwiftUI
import Style

@main
struct RickAndMortyApp: App {
    @Environment(\.style) private var style
    @Environment(\.colorScheme) private var colorScheme
    @Bindable private var router = Router(
        injection: .init(configuration: Configuration())
    )

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                switch router.root {
                case .home:
                    router.home()
                        .navigationDestination(for: Path.self) { path in
                            switch path {
                            case let .character(character):
                                router.character(character)
                            }
                        }
                        .toolbarBackground(
                            style.colors.backgroundsBottomNavigation,
                            for: .navigationBar
                        )
                }
            }
            .animation(.easeIn(duration: 0.2), value: router.root)
            .tint(style.colors.foregroundsPrimary)
            .environment(\.style, AppStyle())
        }
    }
}
