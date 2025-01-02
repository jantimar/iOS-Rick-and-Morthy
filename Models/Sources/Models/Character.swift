//
//  Character.swift
//  Models
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public struct Character {
    // The id of the character.
    public let id: Int
    // The name of the character.
    public let name: String?
    // The status of the character ('Alive', 'Dead' or 'unknown').
    public let status: CharacterStatus?
    // The species of the character.
    public let species: String?
    // The type or subspecies of the character.
    public let type: String?
    // The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    public let gender: CharacterGender?
    // Name and link to the character's origin location.
    public let origin: Location?
    // Name and link to the character's last known location endpoint.
    public let location: Location?
    // Link to the character's image. All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
    public let image: URL?
    // List of episodes in which this character appeared.
    public let episode: [URL]?
    // Link to the character's own URL endpoint.
    public let url: URL?
    // Time at which the character was created in the database.
    public let created: Date?

    // MARK: - Initializers

    public init(
        id: Int,
        name: String? = nil,
        status: CharacterStatus? = .unknown,
        species: String? = nil,
        type: String? = nil,
        gender: CharacterGender? = .unknown,
        origin: Location? = nil,
        location: Location? = nil,
        image: URL? = nil,
        episode: [URL]? = nil,
        url: URL? = nil,
        created: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

extension Character: Equatable, Hashable { }
