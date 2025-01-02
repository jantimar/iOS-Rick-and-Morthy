//
//  QueryItemValue.swift
//  APIService
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public enum QueryItemValue: Hashable {
    case string(String?)
    case integer(Int?)
    case bool(Bool?)
    case array([String])
    case integerArray([Int])
}
