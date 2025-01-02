//
//  CharacterStatus.swift
//  Models
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation
import Locs

public enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown

    public var localized: String {
        switch self {
        case .alive:
            return localize(.characterStatusAlive)
        case .dead:
            return localize(.characterStatusDead)
        case .unknown:
            return localize(.characterStatusUnknown)
        }
    }
}
