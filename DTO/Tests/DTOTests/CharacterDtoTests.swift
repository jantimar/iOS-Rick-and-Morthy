//
//  CharacterDtoTests.swift
//  DTO
//
//  Created by Jan Timar on 29.12.2024.
//

import XCTest
@testable import DTO
@testable import Models

final class CharacterDtoTests: XCTestCase {

    func testEncodeCharacterFromJson() throws {
        guard let jsonData = String.characterMock.data(using: .utf8) else {
            fatalError("Invalid json string")
        }

        let morty = try JSONDecoder().decode(CharacterDto.self, from: jsonData)

        XCTAssertEqual(morty.id, 2)
        XCTAssertEqual(morty.name, "Morty Smith")
        XCTAssertEqual(morty.status, "Alive")
        XCTAssertEqual(morty.species, "Human")
        XCTAssertEqual(morty.type, "")
        XCTAssertEqual(morty.gender, "Male")
        XCTAssertEqual(morty.origin?.name, "Earth")
        XCTAssertEqual(morty.origin?.url, "https://rickandmortyapi.com/api/location/1")
        XCTAssertEqual(morty.location?.name, "Earth")
        XCTAssertEqual(morty.location?.url, "https://rickandmortyapi.com/api/location/20")
        XCTAssertEqual(morty.image, "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
        XCTAssertEqual(morty.episode?.count, 2)
        XCTAssertEqual(morty.url, "https://rickandmortyapi.com/api/character/2")
        XCTAssertEqual(morty.created, "2017-11-04T18:50:21.651Z")
    }

    func testDecodeCharacterFromJson() throws {
        let morty = CharacterDto(
            id: 2,
            name: "Morty Smith",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                id: nil,
                name: "Earth",
                type: nil,
                dimension: nil,
                residents: nil,
                url: "https://rickandmortyapi.com/api/location/1",
                created: nil
            ),
            location: .init(
                id: nil,
                name: "Earth",
                type: nil,
                dimension: nil,
                residents: nil,
                url: "https://rickandmortyapi.com/api/location/20",
                created: nil
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: nil,
            url: "https://rickandmortyapi.com/api/character/2",
            created: "2017-11-04T18:50:21.651Z"
        )

        let json = try JSONEncoder().encode(morty)

        let decodedMorty = try JSONDecoder().decode(CharacterDto.self, from: json)

        XCTAssertEqual(morty.id, decodedMorty.id)
        XCTAssertEqual(morty.name, decodedMorty.name)
        XCTAssertEqual(morty.status, decodedMorty.status)
        XCTAssertEqual(morty.species, decodedMorty.species)
        XCTAssertEqual(morty.type, decodedMorty.type)
        XCTAssertEqual(morty.gender, decodedMorty.gender)
        XCTAssertEqual(morty.origin?.name, decodedMorty.origin?.name)
        XCTAssertEqual(morty.origin?.url, decodedMorty.origin?.url)
        XCTAssertEqual(morty.location?.name, decodedMorty.location?.name)
        XCTAssertEqual(morty.location?.url, decodedMorty.location?.url)
        XCTAssertEqual(morty.image, decodedMorty.image)
        XCTAssertEqual(morty.episode, decodedMorty.episode)
        XCTAssertEqual(morty.url, decodedMorty.url)
        XCTAssertEqual(morty.created, decodedMorty.created)
    }

    func testMapToModel() {
        let mortyDto = CharacterDto(
            id: 2,
            name: "Morty Smith",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                id: nil,
                name: "Earth",
                type: nil,
                dimension: nil,
                residents: nil,
                url: "https://rickandmortyapi.com/api/location/1",
                created: nil
            ),
            location: .init(
                id: nil,
                name: "Earth",
                type: nil,
                dimension: nil,
                residents: nil,
                url: "https://rickandmortyapi.com/api/location/20",
                created: nil
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2"
            ],
            url: "https://rickandmortyapi.com/api/character/2",
            created: "2017-11-04T18:50:21.651Z"
        )

        let morty = Character(from: mortyDto)

        XCTAssertEqual(morty.id, 2)
        XCTAssertEqual(morty.name, "Morty Smith")
        XCTAssertEqual(morty.status, .alive)
        XCTAssertEqual(morty.species, "Human")
        XCTAssertEqual(morty.type, "")
        XCTAssertEqual(morty.gender, .male)
        XCTAssertEqual(morty.origin?.name, "Earth")
        XCTAssertEqual(morty.origin?.url?.absoluteString, "https://rickandmortyapi.com/api/location/1")
        XCTAssertEqual(morty.location?.name, "Earth")
        XCTAssertEqual(morty.location?.url?.absoluteString, "https://rickandmortyapi.com/api/location/20")
        XCTAssertEqual(morty.image?.absoluteString, "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
        XCTAssertEqual(morty.episode?.count, 2)
        XCTAssertEqual(morty.url?.absoluteString, "https://rickandmortyapi.com/api/character/2")
        XCTAssertEqual(morty.created?.timeIntervalSince1970, 1509821421.651)
    }
}

private extension String {

    static let characterMock: String = """
    {
      "id": 2,
      "name": "Morty Smith",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      "url": "https://rickandmortyapi.com/api/character/2",
      "created": "2017-11-04T18:50:21.651Z"
    }
    """
}
