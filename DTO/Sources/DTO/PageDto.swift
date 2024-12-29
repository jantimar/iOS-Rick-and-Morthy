//
//  File.swift
//  DTO
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation
import Models

public struct PageDto<T: Codable>: Codable {
    public let info: PageInfoDto?
    public let results: [T]
}

extension Page<Character> {
    public init(from dto: PageDto<CharacterDto>) {
        self.init(
            info: dto.info.map(PageInfo.init(from:)),
            results: dto.results.map(Character.init(from:))
        )
    }
}

extension Page<Episode> {
    public init(from dto: PageDto<EpisodeDto>) {
        self.init(
            info: dto.info.map(PageInfo.init(from:)),
            results: dto.results.map(Episode.init(from:))
        )
    }
}

extension Page<Location> {
    public init(from dto: PageDto<LocationDto>) {
        self.init(
            info: dto.info.map(PageInfo.init(from:)),
            results: dto.results.map(Location.init(from:))
        )
    }
}
