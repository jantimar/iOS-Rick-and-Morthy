//
//  Item.swift
//  RickAndMorty
//
//  Created by Jan Timar on 27.12.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
