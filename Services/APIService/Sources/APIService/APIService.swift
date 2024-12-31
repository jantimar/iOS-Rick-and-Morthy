//
//  APIService.swift
//  APIService
//
//  Created by Jan Timar on 29.12.2024.
//

import Foundation
import Combine

open class APIService {
    private let session: URLSession

    var globalHeaders: [HeaderKey: String] = [
        .contentType: "application/json",
        .acceptType: "application/json"
    ]

    public init(
        session: URLSession = .shared
    ) {
        self.session = session
    }

    // MARK: - Setup request

    public func setupRequest(
        request: URLRequest,
        headers: [String: String] = [:]
    ) -> URLRequest {
        var requestWithHeaders = request
        // Set global headers
        globalHeaders.forEach { (key, value) in
            if headers[key] == nil && request.value(forHTTPHeaderField: key) == nil {
                requestWithHeaders.addValue(value, forHTTPHeaderField: key)
            }
        }
        // Set additional headers
        headers.forEach { (key, value) in
            requestWithHeaders.addValue(value, forHTTPHeaderField: key)
        }

        return requestWithHeaders
    }

    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()
}

// MARK: - Fetch alternatives
public extension APIService {

    func fetch<Result: Decodable>(
        with resource: Resource,
        headers: [String: String] = [:],
        enableRetry: Bool = true
    ) -> AnyPublisher<Result, APIError> {
        switch resource.createRequest() {
        case let .failure(error):
            return Fail(error: error).eraseToAnyPublisher()
        case let .success(request):
            let stackTrace = Thread.callStackSymbols
            return fetch(
                urlRequest: request,
                resource: resource,
                headers: headers,
                enableRetry: enableRetry
            )
            .flatMap(maxPublishers: .max(1)) { self.decode($0) }
            .eraseToAnyPublisher()
        }
    }

    func fetch<Data: Encodable, Result: Decodable>(
        with resource: Resource,
        data: Data,
        headers: [String: String] = [:],
        enableRetry: Bool = true
    ) -> AnyPublisher<Result, APIError> {
        switch resource.createRequest(with: data) {
        case let .failure(error):
            return Fail(error: error).eraseToAnyPublisher()
        case let .success(request):
            let stackTrace = Thread.callStackSymbols
            return fetch(
                urlRequest: request,
                resource: resource,
                headers: headers,
                enableRetry: enableRetry
            )
            .flatMap(maxPublishers: .max(1)) { self.decode($0) }
            .eraseToAnyPublisher()
        }
    }

    /// Fetch a request with a data in `Content-type: application/x-www-form-urlencoded`
    func fetch<Result: Decodable>(
        with resource: Resource,
        data: [String: QueryItemValue],
        headers: [String: String] = [:],
        enableRetry: Bool = true
    ) -> AnyPublisher<Result, APIError> {
        switch resource.createRequest(with: data) {
        case let .failure(error):
            return Fail(error: error).eraseToAnyPublisher()
        case let .success(request):
            let stackTrace = Thread.callStackSymbols
            return fetch(
                urlRequest: request,
                resource: resource,
                headers: headers,
                enableRetry: enableRetry
            )
            .flatMap(maxPublishers: .max(1)) { self.decode($0) }
            .eraseToAnyPublisher()
        }
    }

    func fetch(
        with resource: Resource,
        headers: [String: String] = [:],
        enableRetry: Bool = true
    ) -> AnyPublisher<Data, APIError> {
        switch resource.createRequest() {
        case let .failure(error):
            return Fail(error: error).eraseToAnyPublisher()
        case let .success(request):
            let stackTrace = Thread.callStackSymbols
            return fetch(
                urlRequest: request,
                resource: resource,
                headers: headers,
                enableRetry: enableRetry
            )
            .map { $0.data }
            .eraseToAnyPublisher()
        }
    }

    private func fetch(
        urlRequest: URLRequest,
        resource: Resource,
        headers: [String: String] = [:],
        enableRetry: Bool = true
    ) -> AnyPublisher<URLSession.DataTaskPublisher.Output, APIError> {
        let request = self.setupRequest(request: urlRequest, headers: headers)
        print(request.curl())

        return self.session.dataTaskPublisher(for: request)
            .mapError { error -> APIError in .response(error) }
            .flatMap { output in
                self.handleResponse(
                    urlRequest: urlRequest,
                    headers: headers,
                    output: output
                )
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Process response
private extension APIService {
    func handleResponse(
        urlRequest: URLRequest,
        headers: [String: String] = [:],
        output: URLSession.DataTaskPublisher.Output
    ) -> AnyPublisher<URLSession.DataTaskPublisher.Output, APIError> {
        guard let httpResponse = output.response as? HTTPURLResponse else {
            return Fail(error: .network("Response is not HTTPURLResponse"))
                .eraseToAnyPublisher()
        }

        return Just(output)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }

    func decode<T: Decodable>(_ output: URLSession.DataTaskPublisher.Output) -> AnyPublisher<T, APIError> {
        if let response = EmptyResponse() as? T, output.data.count == 0 {
            return Just(response)
                .setFailureType(to: APIError.self)
                .eraseToAnyPublisher()
        }

        return Just(output.data)
            .decode(type: T.self, decoder: jsonDecoder)
            .mapError { .parsing($0) }
            .eraseToAnyPublisher()
    }
}

// MARK: - Helpers
public extension APIService {
    func setHeader(_ value: String?, forHTTPHeaderField key: HeaderKey) {
        globalHeaders[key] = value
    }
}
