//
//  URLRequest+Resource.swift
//  APIService
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation

extension URLRequest {
    /// Create URL request from Resouce
    init?(resource: Resource) throws {
        var components = URLComponents(string: resource.url)
        components?.path = resource.path

        if !resource.queryItems.isEmpty {
            var queryItems = [URLQueryItem]()
            resource.queryItems.forEach { item in
                switch item.value {
                case let .string(value):
                    if let value = value {
                        queryItems.append(URLQueryItem(name: item.key, value: value))
                    }
                case let .integer(value):
                    if let value = value {
                        queryItems.append(URLQueryItem(name: item.key, value: "\(value)"))
                    }
                case let .bool(value):
                    if let value = value {
                        queryItems.append(URLQueryItem(name: item.key, value: value ? "true" : "false"))
                    }
                case let .array(values):
                    queryItems.append(
                        contentsOf: values.map { value in
                            URLQueryItem(name: item.key, value: value)
                        }
                    )
                case let .integerArray(values):
                    queryItems.append(
                        contentsOf: values.map { value in
                            URLQueryItem(name: item.key, value: "\(value)")
                        }
                    )
                }
            }
            components?.queryItems = queryItems
        }

        guard let url = components?.url else {
            throw APIError.network("Invalid URL")
        }

        self.init(url: url)
        self.httpMethod = resource.method.rawValue
        self.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    }
}

extension URLRequest {
    /// Return CURL for request
    /// This enable recall request in `Terminal` app or share it for investigate with backend developers
    public func curl(pretty: Bool = true) -> String {
        var data: String = ""
        let complement = pretty ? "\\\n" : ""
        let method = "-X \(self.httpMethod ?? "GET") \(complement)"
        let url = "\"" + (self.url?.absoluteString ?? "") + "\""

        var header = ""
        if let httpHeaders = self.allHTTPHeaderFields, httpHeaders.keys.count > 0 {
            for (key, value) in httpHeaders {
                header += "-H \"\(key): \(value)\" \(complement)"
            }
        }
        if let bodyData = self.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
            data = "-d \"\(bodyString)\" \(complement)"
        }
        let command = "curl -i " + complement + method + header + data + url
        return command
    }
}
