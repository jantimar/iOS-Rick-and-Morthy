//
//  LocationDao.swift
//  DatabaseService
//
//  Created by Jan Timar on 01.01.2025.
//

import Foundation
import SwiftData

@Model
final class LocationDao {
    /// The name of the location.
    var name: String?

    init(name: String?) {
        self.name = name
    }
}
