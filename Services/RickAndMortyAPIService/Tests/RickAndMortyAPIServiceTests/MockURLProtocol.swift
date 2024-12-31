//
//  File.swift
//  RickAndMortyAPIService
//
//  Created by Jan Timar on 30.12.2024.
//

import Foundation

/// URL protocol for replace response for specific requests with prepared response
class MockURLProtocol: URLProtocol {

    override func startLoading() {
        guard let client = client else { return }

        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: 200,
            httpVersion: "HTTP/1.1",
            headerFields: nil
        )!

        client.urlProtocol(
            self,
            didReceive: response,
            cacheStoragePolicy: .notAllowed
        )

        if let fakeResponse = FakeResponse(requst: request)?.data {
            client.urlProtocol(self, didLoad: fakeResponse)
        }

        client.urlProtocolDidFinishLoading(self)
    }

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func stopLoading() {
        // Required method, implement as a no-op.
    }
}
