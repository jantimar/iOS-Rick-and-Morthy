//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import APIService


extension Resource {

    /// You can access the list of episodes by using the /episode endpoint.
    static func episodes(
        _ baseUrl: String,
        name: String? = nil,
        episode: String? = nil,
        page: Int? = nil
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/api/episode",
            queryItems: [
                "page": .integer(page),
                "name": .string(name),
                "episode": .string(episode)
            ]
        )
    }

    /// You can get a single episode by adding the id as a parameter: /episode/28
    static func episode(
        _ baseUrl: String,
        id: Int
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/api/episode/\(id)"
        )
    }
}
