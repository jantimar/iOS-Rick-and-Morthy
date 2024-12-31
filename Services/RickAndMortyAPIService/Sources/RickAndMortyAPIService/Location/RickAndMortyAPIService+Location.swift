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

extension RickAndMortyAPIService: RickAndMortyAPIServiceLocationProcotol {
    /// You can get a single location by adding the id as a parameter: /location/3
    public func location(id: Int) -> AnyPublisher<Location, APIError> {
        let resource: Resource = .location(baseURL, id: id)
        return fetch(with: resource)
            .map(Location.init(from:))
            .eraseToAnyPublisher()
    }

    /// You can access the list of locations by using the /location endpoint.
    public func locations(page: Int) -> AnyPublisher<Page<Location>, APIError> {
        let resource: Resource = .locations(baseURL, page: page)
        return fetch(with: resource)
            .map(Page<Location>.init(from:))
            .eraseToAnyPublisher()
    }
}
