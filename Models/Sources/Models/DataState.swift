//
//  DataState.swift
//  Models
//
//  Created by Jan Timar on 01.01.2025.
//

import Foundation

public enum DataState<T> {
    case loading
    case data(T)
    case refreshing(T)
    case failure(String, retry: Bool = false)
    case unknown

    public var data: T? {
        switch self {
        case let .data(data),
            let .refreshing(data): return data
        default: return nil
        }
    }

    public var isLoading: Bool {
        switch self {
        case .loading: return true
        default: return false
        }
    }

    public var isUnknown: Bool {
        switch self {
        case .unknown: return true
        default: return false
        }
    }

    public var isRefreshing: Bool {
        switch self {
        case .refreshing: return true
        default: return false
        }
    }
}

extension DataState: Equatable {
    public static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.data, .data): return true
        case (.refreshing, .refreshing): return true
        case (.failure, .failure): return true
        default: return false
        }
    }
}
