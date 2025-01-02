//
//  Locs.swift
//  Locs
//
//  Created by Jan Timar on 02.01.2025.
//

import Foundation

public enum LocKey: String {
    // Characters
    case charactersTitle = "characters.title"
    case charactersSearchPlaceholder = "characters.search_placeholder"

    // Favorites
    case favoritesTitle = "favorites.title"

    // Character
    case characterName = "character.name"
    case characterStatus = "character.status"
    case characterSpecies = "character.species"
    case characterType = "character.type"
    case characterGender = "character.gender"
    case characterOrigin = "character.origin"
    case characterLocation = "character.location"

    // Errors
    case errorNoFavorites = "error.no_favorites"
    case errorNoCharactersResults = "error.no_characters_results"
    case errorNetwork = "error.network"
    case errorRetry = "error.retry"

    // Other
    case characterStatusAlive = "character_status.alive"
    case characterStatusDead = "character_status.dead"
    case characterStatusUnknown = "character_status.unknown"

    case characterGenderFemale = "character_gender.female"
    case characterGenderMale = "character_gender.male"
    case characterGenderGenderless = "character_gender.genderless"
    case characterGenderUnknown = "character_gender.unknown"

}

extension LocKey {
    func localized(comment: String = "", _ params: CVarArg...) -> String {
        String(format: NSLocalizedString(rawValue, comment: comment), params)
    }
}

public func localize(
    _ key: LocKey,
    comment: String = "",
    _ params: CVarArg...
) -> String {
    key.localized(comment: comment, params)
}
