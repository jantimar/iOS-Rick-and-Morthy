//
//  RickAndMortyAPIService.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import APIService

public typealias RickAndMortyAPIServiceProtocol = RickAndMortyAPIServiceCharacterProcotol &
RickAndMortyAPIServiceEpisodeProcotol &
RickAndMortyAPIServiceLocationProcotol

public final class RickAndMortyAPIService: APIService {

    let baseURL: String
    var headers: [String: String] = [:]

    public init(
        session: URLSession = .shared,
        baseURL: String
    ) {
        self.baseURL = baseURL

        super.init(session: session)
    }
}
