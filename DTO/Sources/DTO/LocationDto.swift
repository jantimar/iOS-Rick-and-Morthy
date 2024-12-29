//
//  LocationDto.swift
//  DTO
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public struct LocationDto: Codable {
    /// The id of the location.
    public let id: Int?
    /// The name of the location.
    public let name: String?
    /// The type of the location.
    public let type: String?
    /// The dimension in which the location is located.
    public let dimension: String?
    /// List of character who have been last seen in the location.
    public let residents: [String]?
    /// Link to the location's own endpoint.
    public let url: String?
    /// Time at which the location was created in the database.
    public let created: String?
}
