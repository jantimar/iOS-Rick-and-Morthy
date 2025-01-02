//
//  CharacterGender.swift
//  Models
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation
import Locs

public enum CharacterGender: String {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown

    public var localized: String {
        switch self {
        case .female:
            return localize(.characterGenderFemale)
        case .male:
            return localize(.characterGenderMale)
        case .genderless:
            return localize(.characterGenderGenderless)
        case .unknown:
            return localize(.characterGenderUnknown)
        }
    }
}
