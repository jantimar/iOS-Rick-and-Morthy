//
//  Resource.swift
//  APIService
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation
import Utils

/// Helper structure for enable define any URL resource
public struct Resource {
    public let url: String
    public let method: URLMethod
    public let path: String
    public let queryItems: [String: QueryItemValue]

    public init(
        url: String,
        method: URLMethod = .get,
        path: String,
        queryItems: [String: QueryItemValue] = [:]
    ) {
        self.url = url
        self.method = method
        self.path = path
        self.queryItems = queryItems
    }

    public init?(
        url: String,
        method: URLMethod = .get,
        urlSuffix: String = ""
    ) {
        let absoluteString = url + urlSuffix
        guard let components = URLComponents(string: absoluteString) else {
            return nil
        }

        self.url = url
        self.path = components.path
        self.method = method

        var items = [String: QueryItemValue]()
        components.queryItems?.forEach { item in
            if let value = items[item.name] {
                switch value {
                case let .array(values):
                    items[item.name] = .array(values + [item.value ?? ""])
                case let .string(value):
                    items[item.name] = .array([value ?? ""] + [item.value ?? ""])
                default:
                    items[item.name] = .string(item.value)
                }
            } else {
                items[item.name] = .string(item.value)
            }
        }
        self.queryItems = items
    }
}

extension Resource: Hashable {}

extension Resource {

    /// Return URL request withou HTTP body
    func createRequest() -> Result<URLRequest, APIError> {
        guard let request = try? URLRequest(resource: self) else {
            return .failure(.network("Invalid URL"))
        }
        return .success(request)
    }

    /// Return URL request with JSON HTTP body
    func createRequest<T: Encodable>(
        with httpBody: T
    ) -> Result<URLRequest, APIError> {
        switch createRequest() {
        case var .success(request):
            do {
                request.httpBody = try JSONEncoder().encode(httpBody)
                return .success(request)
            } catch {
                return .failure(.parsing(error))
            }
        case let .failure(error):
            return .failure(error)
        }
    }

    /// Return URL request with JSON HTTP body
    func createRequest(
        with items: [String: QueryItemValue]
    ) -> Result<URLRequest, APIError> {
        switch createRequest() {
        case var .success(request):
            var data = [String: String]()
            for item in items {
                switch item.value {
                case let .string(value):
                    if let value = value {
                        data[item.key] = value
                    }
                case let .integer(value):
                    if let value = value {
                        data[item.key] = value.string
                    }
                case let .bool(value):
                    if let value = value {
                        data[item.key] = value ? "true" : "false"
                    }
                case let .array(values):
                    data[item.key] = "\(values)"
                case let .integerArray(values):
                    data[item.key] = "\(values.map(\.string))"
                }
            }

            request.httpBody = data.map { [$0, $1].joined(separator: "=") }
                .joined(separator: "&")
                .data(using: .utf8)

            return .success(request)
        case let .failure(error):
            return .failure(error)
        }
    }
}
