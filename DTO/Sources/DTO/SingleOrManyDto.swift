//
//  File.swift
//  DTO
//
//  Created by Jan Timar on 02.01.2025.
//

import Foundation

public struct SingleOrManyDto<T: Decodable>: Decodable {
    public let values: [T]?

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let single = try? container.decode(T.self) {
            values = [single]
        } else {
            values = try container.decode([T].self)
        }
    }
}
