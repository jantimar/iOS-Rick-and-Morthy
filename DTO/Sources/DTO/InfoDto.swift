//
//  PageInfoDto.swift
//  DTO
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import Models

public struct PageInfoDto: Codable {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?
}

extension PageInfo {
    public init(from dto: PageInfoDto) {
        self.init(
            count: dto.count,
            pages: dto.pages,
            next: dto.next,
            prev: dto.prev
        )
    }
}
