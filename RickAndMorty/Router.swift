//
//  Router.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Models

enum Path: Hashable {
    case character(Character)
}

enum Root {
    case home
}

@Observable
final class Router {

    var path: [Path] = []
    private(set) var root: Root = .home

    private let injection: InjectionContainer

    init(injection: InjectionContainer) {
        self.injection = injection
    }

    func push(_ path: Path) {
        self.path.append(path)
    }

    func set(root: Root) {
        self.root = root
    }

    // MARK: - Lazy view models

    @ObservationIgnored
    private lazy var charactersViewModel = CharactersViewModel(
        apiService: injection.apiService,
        databaseService: injection.favoritesDatabaseService,
        router: self
    )

    @ObservationIgnored
    private lazy var favoritesViewModel = FavoritesViewModel(
        apiService: injection.apiService,
        databaseService: injection.favoritesDatabaseService,
        router: self
    )
}

// MARK: - Screens
extension Router {

    func home() -> HomeView {
        .init(
            viewModel: .init(router: self)
        )
    }

    func favorites() -> FavoritesView {
        .init(viewModel: favoritesViewModel)
    }

    func characters() -> CharactersView {
        .init(viewModel: charactersViewModel)
    }

    func character(_ character: Character) -> CharacterView {
        .init(
            viewModel: .init(
                character: character,
                apiService: injection.apiService,
                databaseService: injection.favoritesDatabaseService,
                router: self
            )
        )
    }
}
