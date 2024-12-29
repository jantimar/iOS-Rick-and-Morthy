//
//  EpisodeDto.swift
//  DTO
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

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
