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

public protocol RickAndMortyAPIServiceEpisodeProcotol {
    /// You can get a single episode by adding the id as a parameter: /episode/28
    func episode(id: Int) -> AnyPublisher<Episode, APIError>
    /// You can access the list of episodes by using the /episode endpoint.
    func episodes(page: Int) -> AnyPublisher<Page<Episode>, APIError>
}
