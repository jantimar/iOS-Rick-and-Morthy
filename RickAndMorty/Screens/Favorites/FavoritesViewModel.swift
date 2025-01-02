//
//  FavoritesViewModel.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Combine
import RickAndMortyAPIService
import DatabaseService
import Models
import Locs

@Observable
final class FavoritesViewModel {

    var characters: DataState<[Character]> = .unknown
    private var charactersValueSubject = CurrentValueSubject<[Character], Never>([])

    private let apiService: RickAndMortyAPIServiceCharacterProcotol
    private let databaseService: DatabaseServiceProtocol?
    let router: Router
    private var disposBag = Set<AnyCancellable>()

    init(
        apiService: RickAndMortyAPIServiceCharacterProcotol,
        databaseService: DatabaseServiceProtocol?,
        router: Router
    ) {
        self.apiService = apiService
        self.databaseService = databaseService
        self.router = router
        self.setup()
    }

    private func setup() {
        let apiService = self.apiService

        // Fetch current data from API, in case it failed, let a show data from DB
        charactersValueSubject
            .map { $0.map(\.id).sorted() }
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .flatMap { ids in
                apiService.characters(ids: ids)
            }
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] characters in
                    self?.charactersValueSubject.value = characters
                }
            )
            .store(in: &disposBag)

        // Sort and updata data from Current value subject to published property
        charactersValueSubject
            .map { $0.sorted(by: { $0.id < $1.id }) }
            .sink(receiveValue: { [weak self] characters in
                self?.characters = .data(characters)
            })
            .store(in: &disposBag)
    }

    func update() {
        // Fetch data from favorites DB
        databaseService?.charactersPublisher()
            .sink(receiveValue: { [weak self] characters in
                guard characters.count > 0 else {
                    self?.characters = .failure(localize(.errorNoFavorites))
                    return
                }
                self?.charactersValueSubject.value = characters
            })
            .store(in: &disposBag)
    }
}
