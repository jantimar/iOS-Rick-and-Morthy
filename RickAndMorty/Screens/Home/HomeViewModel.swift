//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import Foundation
import Combine

@Observable
final class HomeViewModel {

    let router: Router

    init(
        router: Router
    ) {
        self.router = router
        self.setup()
    }

    private func setup() {
        
    }
}
