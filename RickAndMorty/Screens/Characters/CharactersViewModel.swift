//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Combine
import RickAndMortyAPIService
import Models
import DatabaseService
import Locs
import APIService

@Observable
final class CharactersViewModel {

    var search = CurrentValueSubject<String, Never>("")

    var characters: DataState<[Character]> = .unknown

    private let apiService: RickAndMortyAPIServiceCharacterProcotol
    private let databaseService: DatabaseServiceProtocol?
    let router: Router
    private var charactersRequest: AnyCancellable?
    private var favorites: [Int] = []
    private var disposBag = Set<AnyCancellable>()

    private var page = 1
    private var fetchedPages = [Page<Character>]() {
        didSet {
            characters = .data(
                fetchedPages
                    .map(\.results)
                    .flatMap { $0 }
            )
        }
    }

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
        refresh()

        search
            .dropFirst()
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink(receiveValue: { [weak self] _ in
                self?.page = 1
                self?.fetchNextPage()
            })
            .store(in: &disposBag)
    }

    func refresh() {
        page = 1
        fetchedPages = []
        fetchNextPage()
    }

    func refreshFavorites() {
        databaseService?.charactersPublisher()
            .sink(receiveValue: { [weak self] favorites in
                self?.favorites = favorites.map(\.id)
            })
            .store(in: &disposBag)
    }

    func fetchNextPage() {
        if let data = characters.data, data.count > 0 {
            characters = .refreshing(data)
        } else {
            characters = .loading
        }

        charactersRequest = apiService.characters(search: search.value, page: page)
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case let .failure(error) = completion {
                        if error is APIError {
                            self?.characters = .failure(localize(.errorNetwork), retry: true)
                        } else {
                            self?.characters = .failure(localize(.errorNoCharactersResults))
                        }
                    }
                },
                receiveValue: { [weak self] data in
                    guard let self else { return }
                    if self.page == 1 {
                        self.fetchedPages = [data]
                    } else {
                        self.fetchedPages.append(data)
                    }

                    self.page += 1
                }
            )
    }

    func isFavorite(character: Character) -> Bool {
        favorites.contains(character.id)
    }
}
