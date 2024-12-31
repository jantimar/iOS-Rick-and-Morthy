//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import APIService
import Models

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
            path: "/characters",
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
            path: "/characters/\(id)"
        )
    }

    static func characters(
        _ baseUrl: String,
        search: String,
        page: Int? = nil
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/characters/?\(search)",
            queryItems: [
                "page": .integer(page)
            ]
        )
    }
}
