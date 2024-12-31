//
//  FavoritesViewModel.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Combine
import RickAndMortyAPIService

@Observable
final class FavoritesViewModel {

    private let apiService: RickAndMortyAPIServiceCharacterProcotol

    init(
        apiService: RickAndMortyAPIServiceCharacterProcotol,
        router: Router
    ) {
        self.apiService = apiService
        self.setup()
    }

    private func setup() {

    }
}
