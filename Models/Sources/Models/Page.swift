//
//  Page.swift
//  Models
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation

public struct Page<T> {
    public let info: PageInfo?
    public let results: [T]

    // MARK: - Initializers

    public init(info: PageInfo? = nil, results: [T]) {
        self.info = info
        self.results = results
    }
}
