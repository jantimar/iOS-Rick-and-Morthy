//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Jan Timar on 31.12.2024.
//

import SwiftUI
import Atoms
import Templates

struct HomeView: View {

    @Environment(\.style) private var style
    @State var viewModel: HomeViewModel

    var body: some View {
        TabBarView(tabs: BottomBarButton.allCases) { tab in
            switch tab {
            case .characters:
                viewModel.router.characters()
            case .favorite:
                viewModel.router.favorites()
            }

        }
        .ignoresSafeArea()
    }
}
