//
//  File.swift
//  Utils
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

extension String {
    /// Parse date from string in`ISO8601`, return `nil` in case if parsing failed
    public func iso8601Date() -> Date? {
        let formatter = ISO8601DateFormatter()

        let options: [ISO8601DateFormatter.Options] = [
            [.withInternetDateTime, .withFractionalSeconds], // Internet date time + miliseconds
            [.withInternetDateTime], // Internet date
            // Date and Time with space separator between date and time
            [.withFullDate, .withFullTime, .withSpaceBetweenDateAndTime],
            [.withFullDate, .withFullTime], // Date and time
            [.withFullDate], // Full date
            [.withDay, .withMonth, .withYear] // Day month year
        ]

        return options
            .compactMap {
                formatter.formatOptions = $0
                return formatter.date(from: self)
            }
            .first
    }
}
