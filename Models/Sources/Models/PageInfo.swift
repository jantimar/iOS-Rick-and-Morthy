//
//  PageInfo.swift
//  Models
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation

public struct PageInfo {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?

    /// Return true when next page dont exist
    public var isLast: Bool { next == nil }

    // MARK: - Initializers

    public init(
        count: Int,
        pages: Int,
        next: String? = nil,
        prev: String? = nil
    ) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
