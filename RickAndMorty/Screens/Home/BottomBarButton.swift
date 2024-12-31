//
//  BottomBarButton.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Molecules
import Atoms

enum BottomBarButton: Int, CaseIterable, BottomBarButtonProtocol {
    case characters, favorite

    var icon: IconType {
        switch self {
        case .characters:
            return .characters
        case .favorite:
            return .favorite(selected: false)
        }
    }

    var id: Int { rawValue }
}

