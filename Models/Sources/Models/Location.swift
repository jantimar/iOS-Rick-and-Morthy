//
//  Location.swift
//  Models
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public struct Location {
    /// The id of the location.
    public let id: Int?
    /// The name of the location.
    public let name: String?
    /// The type of the location.
    public let type: String?
    /// The dimension in which the location is located.
    public let dimension: String?
    /// List of character who have been last seen in the location.
    public let residents: [URL]?
    /// Link to the location's own endpoint.
    public let url: URL?
    /// Time at which the location was created in the database.
    public let created: Date?

    // MARK: - Initializers

    public init(
        id: Int? = nil,
        name: String? = nil,
        type: String? = nil,
        dimension: String? = nil,
        residents: [URL]? = nil,
        url: URL? = nil,
        created: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
}
