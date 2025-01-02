//
//  Configuration.swift
//  RickAndMorty
//
//  Created by Jan Timar on 02.01.2025.
//

import Foundation

struct Configuration {
    let baseUrl: String

    init(
        baseUrl: String = "https://rickandmortyapi.com"
    ) {
        self.baseUrl = baseUrl
    }
}
