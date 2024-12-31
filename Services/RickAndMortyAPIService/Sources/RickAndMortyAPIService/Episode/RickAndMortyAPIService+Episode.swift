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
    /// You can access the list of locations by using the /location endpoint.
    public func episode(id: Int) -> AnyPublisher<Episode, APIError> {
        let resource: Resource = .episode(baseURL, id: id)
        return fetch(with: resource)
            .map(Episode.init(from:))
            .eraseToAnyPublisher()
    }

    /// You can get a single location by adding the id as a parameter: /location/3
    public func episodes(page: Int) -> AnyPublisher<Page<Episode>, APIError> {
        let resource: Resource = .episodes(baseURL, page: page)
        return fetch(with: resource)
            .map(Page<Episode>.init(from:))
            .eraseToAnyPublisher()
    }
}
