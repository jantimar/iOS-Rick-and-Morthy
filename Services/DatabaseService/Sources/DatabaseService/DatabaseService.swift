//
//  DatabaseService.swift
//  DatabaseService
//
//  Created by Jan Timar on 01.01.2025.
//

import Foundation
import SwiftData
import Models
import Combine

public protocol DatabaseServiceProtocol {
    @MainActor
    func characters() -> [Character]
    @MainActor
    func insert(character: Character) throws
    @MainActor
    func delete(character: Character) throws

    func charactersPublisher() -> AnyPublisher<[Character], Never>
}

@MainActor
public class DatabaseService {

    private let container: ModelContainer
    private var context: ModelContext { container.mainContext }

    public init?(fileName: String = "database.sqlite") {
        let url = URL.documentsDirectory.appending(path: fileName)
        let schema = Schema([
            CharacterDao.self,
            LocationDao.self
        ])

        guard let container = try? ModelContainer(
            for: schema,
            configurations: ModelConfiguration(url: url)
        ) else { return nil }

        self.container = container
    }
}

extension DatabaseService: @preconcurrency DatabaseServiceProtocol {
    public func characters() -> [Character] {
        let descriptor = FetchDescriptor<CharacterDao>(
            sortBy: [SortDescriptor(\.name)]
        )

        do {
            let models = try context.fetch(descriptor)

            return models
                .map(Character.init(from:))
        } catch {
            return []
        }
    }

    public func insert(character: Character) throws {
        let model = CharacterDao(character: character)
        context.insert(model)
        try context.save()
    }

    public func delete(character: Character) throws {
        let characterId = character.id
        let predicate = #Predicate<CharacterDao> {
            $0.id == characterId
        }

        let descriptor = FetchDescriptor<CharacterDao>(
            predicate: predicate,
            sortBy: [SortDescriptor(\.name)]
        )

        do {
            let models = try context.fetch(descriptor)
            models.forEach { context.delete($0) }

            try context.save()
        } catch { }
    }

    public func charactersPublisher() -> AnyPublisher<[Character], Never> {
        Future<[Character], Never> { promise in
            Task { @MainActor in
                let characters = self.characters()
                promise(.success(characters))
            }
        }
        .eraseToAnyPublisher()
    }
}
