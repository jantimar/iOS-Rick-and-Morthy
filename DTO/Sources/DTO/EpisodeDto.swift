//
//  EpisodeDto.swift
//  DTO
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation
import Models
import Utils

public struct EpisodeDto: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }

    /// The id of the episode.
    public let id: Int
    /// The name of the episode.
    public let name: String?
    /// The air date of the episode.
    public let airDate: String?
    /// The code of the episode.
    public let episode: String?
    /// List of characters who have been seen in the episode.
    public let characters: [String]?
    /// Link to the episode's own endpoint.
    public let url: String?
    /// Time at which the episode was created in the database.
    public let created: String?
}

extension Episode {
    public init(from dto: EpisodeDto) {
        self.init(
            id: dto.id,
            name: dto.name,
            airDate: dto.airDate,
            episode: dto.episode,
            characters: dto.characters?.compactMap { URL(string: $0) },
            url: URL(string: dto.url ?? ""),
            created: dto.created?.iso8601Date()
        )
    }
}
