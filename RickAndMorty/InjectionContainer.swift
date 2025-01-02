//
//  InjectionContainer.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import RickAndMortyAPIService
import DatabaseService

final class InjectionContainer {

    let apiService: RickAndMortyAPIServiceProtocol
    let favoritesDatabaseService: DatabaseServiceProtocol?

    @MainActor
    init(configuration: Configuration) {
        self.apiService = RickAndMortyAPIService(baseURL: configuration.baseUrl)
        self.favoritesDatabaseService = DatabaseService()
    }
}
