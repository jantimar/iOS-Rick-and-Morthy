//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import APIService

extension Resource {

    /// You can access the list of locations by using the /location endpoint.
    static func locations(
        _ baseUrl: String,
        name: String? = nil,
        type: String? = nil,
        dimension: String? = nil,
        page: Int? = nil
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/api/location",
            queryItems: [
                "page": .integer(page),
                "name": .string(name),
                "type": .string(name),
                "dimension": .string(name)
            ]
        )
    }

    /// You can get a single location by adding the id as a parameter: /location/3
    static func location(
        _ baseUrl: String,
        id: Int
    ) -> Resource {
        .init(
            url: baseUrl,
            method: .get,
            path: "/api/location/\(id)"
        )
    }
}

