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
    /// API service for comunication with Rick & Morty backand
    let apiService: RickAndMortyAPIServiceProtocol
    /// Database service for store all favorites characters
    let favoritesDatabaseService: DatabaseServiceProtocol?

    @MainActor
    init(configuration: Configuration) {
        self.apiService = RickAndMortyAPIService(baseURL: configuration.baseUrl)
        self.favoritesDatabaseService = DatabaseService()
    }
}
