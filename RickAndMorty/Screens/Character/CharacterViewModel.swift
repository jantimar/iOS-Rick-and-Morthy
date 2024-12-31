//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Combine
import RickAndMortyAPIService
import Models

@Observable
final class CharacterViewModel {

    var character: Character

    private let apiService: RickAndMortyAPIServiceCharacterProcotol

    init(
        character: Character,
        apiService: RickAndMortyAPIServiceCharacterProcotol,
        router: Router
    ) {
        self.character = character
        self.apiService = apiService
        self.setup()
    }

    private func setup() {

    }
}
