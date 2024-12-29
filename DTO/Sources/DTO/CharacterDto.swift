//
//  CharacterDto.swift
//  DTO
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public struct CharacterDto: Codable {
    // The id of the character.
    public let id: Int
    // The name of the character.
    public let name: String?
    // The status of the character ('Alive', 'Dead' or 'unknown').
    public let status: String?
    // The species of the character.
    public let species: String?
    // The type or subspecies of the character.
    public let type: String?
    // The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    public let gender: String?
    // Name and link to the character's origin location.
    public let origin: LocationDto?
    // Name and link to the character's last known location endpoint.
    public let location: LocationDto?
    // Link to the character's image. All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
    public let image: String?
    // List of episodes in which this character appeared.
    public let episode: [String]?
    // Link to the character's own URL endpoint.
    public let url: String?
    // Time at which the character was created in the database.
    public let created: String?

}
