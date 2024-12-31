//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation

public enum FakeResponse {
    case episodes, characters, locations

    init?(requst: URLRequest) {
        switch requst.url?.pathComponents {
        case ["/", "episode"]:
            self = .episodes
        default:
            print("COMPONENTS: \(requst.url?.pathComponents.description ?? "")")
            return nil
        }
    }

    var data: Data? {
        switch self {
        case .episodes:
            return """
                {
                "info": {
                "count": 51,
                "pages": 3,
                "next": "https://rickandmortyapi.com/api/episode?page=2",
                "prev": null
                },
                "results": [
                {
                "id": 1,
                "name": "Pilot",
                "air_date": "December 2, 2013",
                "episode": "S01E01",
                "characters": [
                "https://rickandmortyapi.com/api/character/1",
                "https://rickandmortyapi.com/api/character/2",
                ],
                "url": "https://rickandmortyapi.com/api/episode/1",
                "created": "2017-11-10T12:56:33.798Z"
                },
                ]
                }
                """.data(using: .utf8)
        default:
            return nil
        }
    }
}
