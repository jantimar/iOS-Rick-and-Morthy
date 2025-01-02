//
//  CharacterDao.swift
//  DatabaseService
//
//  Created by Jan Timar on 01.01.2025.
//

import Foundation
import SwiftData
import Models

@Model
final class CharacterDao {
    // The id of the character.
    @Attribute(.unique)
    var id: Int
    // The name of the character.
    var name: String?
    // The status of the character ('Alive', 'Dead' or 'unknown').
    var status: String?
    // The species of the character.
    var species: String?
    // The type or subspecies of the character.
    var type: String?
    // The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    var gender: String?
    // Name and link to the character's origin location.
    @Relationship(deleteRule: .cascade)
    var origin: LocationDao?
    // Name and link to the character's last known location endpoint.
    @Relationship(deleteRule: .cascade)
    var location: LocationDao?
    // Link to the character's image. All images are 300x300px and most are medium shots
    // or portraits since they are intended to be used as avatars.
    var image: String?
    // Link to the character's own URL endpoint.
    var url: String?
    // Time at which the character was created in the database.
    var created: Date?

    init(character: Character) {
        self.id = character.id
        self.name = character.name
        self.status = character.status?.rawValue
        self.species = character.species
        self.type = character.type
        self.gender = character.gender?.rawValue
        self.origin = .init(name: character.origin?.name)
        self.location = .init(name: character.location?.name)
        self.image = character.image?.absoluteString
        self.url = character.url?.absoluteString
        self.created = character.created
    }
}

extension Character {
    init(from dao: CharacterDao) {
        self.init(
            id: dao.id,
            name: dao.name,
            status: dao.status.map(CharacterStatus.init(rawValue:)) ?? .unknown,
            species: dao.species,
            type: dao.type,
            gender: dao.gender.map(CharacterGender.init(rawValue:)) ?? .unknown,
            origin: Location(name: dao.origin?.name),
            location: Location(name: dao.location?.name),
            image: URL(string: dao.image ?? ""),
            url: URL(string: dao.url ?? ""),
            created: dao.created
        )
    }
}
