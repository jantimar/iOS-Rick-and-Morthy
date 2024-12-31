//
//  APIError.swift
//  APIService
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

public enum APIError: Error {
    case network(String)
    case response(URLError)
    case parsing(Error)
    case invalidStatusCode(Int)
}
