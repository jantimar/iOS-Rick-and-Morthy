//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import APIService
import Combine
import Models
import DTO

extension RickAndMortyAPIService: RickAndMortyAPIServiceCharacterProcotol {
    /// You can get a single character by adding the id as a parameter: /character/2
    public func character(id: Int) -> AnyPublisher<Character, APIError> {
        let resource: Resource = .character(baseURL, id: id)
        return fetch(with: resource)
            .map(Character.init(from:))
            .eraseToAnyPublisher()
    }

    /// You can get a single character by adding the id as a parameter: /character/2
    public func characters(page: Int) -> AnyPublisher<Page<Character>, APIError> {
        let resource: Resource = .characters(baseURL, page: page)
        return fetch(with: resource)
            .map(Page<Character>.init(from:))
            .eraseToAnyPublisher()
    }

    public func characters(search: String, page: Int) -> AnyPublisher<Page<Character>, APIError> {
        let resource: Resource = .characters(baseURL, search: search, page: page)
        return fetch(with: resource)
            .map(Page<Character>.init(from:))
            .eraseToAnyPublisher()
    }
}
