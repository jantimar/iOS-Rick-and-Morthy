//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Combine
import RickAndMortyAPIService
import DatabaseService
import Models

@Observable
final class CharacterViewModel {

    var character: Character
    var isFavorite: Bool?

    private let apiService: RickAndMortyAPIServiceCharacterProcotol
    private let databaseService: DatabaseServiceProtocol?
    private var disposBag = Set<AnyCancellable>()

    init(
        character: Character,
        apiService: RickAndMortyAPIServiceCharacterProcotol,
        databaseService: DatabaseServiceProtocol?,
        router: Router
    ) {
        self.character = character
        self.apiService = apiService
        self.databaseService = databaseService
        self.setup()
    }

    private func setup() {
        // Fetch favorite
        Task { @MainActor in
            guard let characters = databaseService?.characters() else {
                return
            }

            isFavorite = characters.contains(where: { $0.id == self.character.id })
        }
    }

    func update() {
        // Fetch full character
        apiService.character(id: character.id)
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] character in
                    self?.character = character
                }
            )
            .store(in: &disposBag)

    }

    func toggleFavorite() {
        Task { @MainActor in
            do {
                if isFavorite == true {
                    try databaseService?.delete(character: character)
                } else {
                    try databaseService?.insert(character: character)
                }

                isFavorite = isFavorite != true
            } catch {
                // Ignore error for now
            }
        }
    }
}
