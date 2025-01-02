import XCTest
import APIService
import Combine
import Models
import DTO
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
            baseURL: "https://rickandmortyapi.com"
        )
    }

    @MainActor
    func testFetchAllEpisodes() throws {
        var episodes: Page<Episode>?

        let episodesExpectation = expectation(description: "episodes")

        apiService?.episodes(page: 0)
            .receive(on: RunLoop.main)
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

        waitForExpectations(timeout: 3)

        XCTAssertEqual(episodes?.info?.count, 51)
        XCTAssertEqual(episodes?.info?.pages, 3)
        XCTAssertEqual(episodes?.info?.next, "https://rickandmortyapi.com/api/episode?page=2")
        XCTAssertEqual(episodes?.info?.prev, nil)

        XCTAssertEqual(episodes?.results.first?.id, 1)
        XCTAssertEqual(episodes?.results.first?.name, "Pilot")
        XCTAssertEqual(episodes?.results.first?.airDate, "December 2, 2013")
        XCTAssertEqual(episodes?.results.first?.episode, "S01E01")
        XCTAssertEqual(episodes?.results.first?.characters?.count, 2)

    }

}
