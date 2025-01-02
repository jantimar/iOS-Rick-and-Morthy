//
//  File.swift
//  Utils
//
//  Created by Jan Timar on 01.01.2025.
//

import Foundation
@preconcurrency import Combine
import SwiftUI

extension CurrentValueSubject {
    public var binding: Binding<Output> {
        .init(
            get: { self.value },
            set: { self.value = $0 }
        )
    }
}
