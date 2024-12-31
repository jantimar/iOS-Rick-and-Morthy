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

public protocol RickAndMortyAPIServiceCharacterProcotol {
    /// You can get a single character by adding the id as a parameter: /character/2
    func character(id: Int) -> AnyPublisher<Character, APIError>
    /// You can get a single character by adding the id as a parameter: /character/2
    func characters(page: Int) -> AnyPublisher<Page<Character>, APIError>
    func characters(search: String, page: Int) -> AnyPublisher<Page<Character>, APIError>
}
