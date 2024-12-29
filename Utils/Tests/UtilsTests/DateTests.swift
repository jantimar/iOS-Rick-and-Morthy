//
//  DateTests.swift
//  Utils
//
//  Created by Jan Timar on 29.12.2024.
//

import XCTest
@testable import Utils

final class ModelsTests: XCTestCase {

    func testAPIDate() {
        XCTAssertEqual(
            "2023-09-28T10:25:00.000Z".iso8601Date()?.timeIntervalSince1970,
            1695896700
        )

        XCTAssertEqual(
            "2023-09-28T10:00:00.000Z".iso8601Date()?.timeIntervalSince1970,
            1695895200
        )

        XCTAssertEqual(
            "2017-11-04T18:50:21.651Z".iso8601Date()?.timeIntervalSince1970,
            1509821421.651
        )
    }
}
