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

public protocol RickAndMortyAPIServiceLocationProcotol {
    /// You can get a single location by adding the id as a parameter: /location/3
    func location(id: Int) -> AnyPublisher<Location, APIError>
    /// You can access the list of locations by using the /location endpoint.
    func locations(page: Int) -> AnyPublisher<Page<Location>, APIError>
}
