import XCTest
import APIService
import Combine
import Models
@testable import RickAndMortyAPIService

final class RickAndMortyAPIServiceTests: XCTestCase {
    var apiService: RickAndMortyAPIServiceProtocol?

    var disposBag = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()

        // Set fake responses
        let urlConfiguration = URLSessionConfiguration.ephemeral
        urlConfiguration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: urlConfiguration)

        URLProtocol.registerClass(MockURLProtocol.self)

        self.apiService = RickAndMortyAPIService(
            session: session,
            baseURL: "https://rickandmortyapi.com/api"
        )
    }

    @MainActor
    func testFetchAllEpisodes() throws {
        var episodes: Page<Episode>?

        let episodesExpectation = expectation(description: "episodes")

        apiService?.episodes(page: 0)
        .sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    XCTFail("Fetch episodes failed: \(error)")
                }
            },
            receiveValue: { response in
                episodes = response
                episodesExpectation.fulfill()
            }
        )
        .store(in: &disposBag)

        waitForExpectations(timeout: 40)

        // TODO: Fix crash later
//        XCTAssertEqual(token, expectedToken)
    }

}
