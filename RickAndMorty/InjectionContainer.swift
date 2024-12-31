//
//  InjectionContainer.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import RickAndMortyAPIService

final class InjectionContainer {

    let apiService: RickAndMortyAPIServiceProtocol

    init() {
        // TODO: Move to configurations file
        self.apiService = RickAndMortyAPIService(baseURL: "https://rickandmortyapi.com/api")
    }
}
