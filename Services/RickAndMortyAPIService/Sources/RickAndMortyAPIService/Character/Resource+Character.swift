//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import APIService
import Models
import Utils

extension Resource {

    /// You can access the list of characters by using the /character endpoint.
    static func characters(
        _ baseUrl: String,
        name: String? = nil,
        status: String? = nil,
        species: String? = nil,
        type: String? = nil,
        gender: String? = nil,
        page: Int? = nil
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/api/character",
            queryItems: [
                "page": .integer(page),
                "name": .string(name),
                "status": .string(status),
                "species": .string(species),
                "type": .string(type),
                "gender": .string(gender)
            ]
        )
    }

    /// You can get a single character by adding the id as a parameter: /character/2
    static func character(
        _ baseUrl: String,
        id: Int
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/api/character/\(id)"
        )
    }

    /// You can get multiple characters by adding an array of ids as parameter: /character/[1,2,3] or /character/1,2,3
    static func characters(
        _ baseUrl: String,
        ids: [Int]
    ) -> Resource {
        let idsQuery = ids
            .map(\.string)
            .joined(separator: ",")

        return .init(
            url: baseUrl,
            method: .get,
            path: "/api/character/\(idsQuery)"
        )
    }
}
