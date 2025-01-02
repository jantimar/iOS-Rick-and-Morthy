//
//  CachedImage.swift
//  Molecules
//
//  Created by Jan Timar on 28.12.2024.
//

import Foundation
import SwiftUI
import Style

@MainActor
private let cache = InMemoryCache<URL, Image>()

public struct CachedImage: View {
    @Environment(\.style) private var style

    private let url: URL?

    public var body: some View {
        if let url = url {
            if let image = cache[url] {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .onAppear(perform: { cache[url] = image })
                    } else {
                        style.colors.backgroundsTertiary
                    }
                }
            }
        }
    }

    public init(url: URL?) {
        self.url = url
    }
}

// In memory FIFO cache
private final class InMemoryCache<Key: Hashable, Value> {

    private var maxSize: Int
    private var keys = [Key]()
    private var data = [Key: Value]()

    func add(_ value: Value, for key: Key) {
        data[key] = value

        if keys.contains(key) {
            return
        }

        if keys.count >= maxSize {
            keys.removeFirst()
        }

        keys.append(key)
    }

    func value(for key: Key) -> Value? {
        data[key]
    }

    subscript(
        key: Key
    ) -> Value? {
        get { value(for: key) }
        set {
            guard let value = newValue else { return }
            add(value, for: key)
        }
    }

    init(
        maxSize: Int = 100
    ) {
        self.maxSize = maxSize
    }
}
