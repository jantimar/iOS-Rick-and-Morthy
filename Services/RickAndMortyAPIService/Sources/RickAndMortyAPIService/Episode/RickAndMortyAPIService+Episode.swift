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

extension RickAndMortyAPIService: RickAndMortyAPIServiceEpisodeProcotol {
    /// You can access the list of episodes by using the /episode endpoint.
    public func episode(id: Int) -> AnyPublisher<Episode, APIError> {
        let resource: Resource = .episode(baseURL, id: id)
        return fetch(with: resource)
            .map(Episode.init(from:))
            .eraseToAnyPublisher()
    }

    /// You can get a single episode by adding the id as a parameter: /episode/28
    public func episodes(page: Int) -> AnyPublisher<Page<Episode>, APIError> {
        let resource: Resource = .episodes(baseURL, page: page)
        return fetch(with: resource)
            .map(Page<Episode>.init(from:))
            .eraseToAnyPublisher()
    }
}
