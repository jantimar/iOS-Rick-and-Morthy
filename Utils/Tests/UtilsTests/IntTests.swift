//
//  File.swift
//  Utils
//
//  Created by Jan Timar on 31.12.2024.
//

import XCTest
@testable import Utils

final class IntTests: XCTestCase {

    func testIntToString() {
        XCTAssertEqual(
            95.string,
            "95"
        )

        XCTAssertEqual(
            (-12345).string,
            "-12345"
        )
    }
}
