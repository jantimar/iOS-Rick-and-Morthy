//
//  File.swift
//  Organisms
//
//  Created by Jan Timar on 01.01.2025.
//

import Style
import UIKit
import Atoms

extension UISearchBar {
    public static func setupAppearance(color: UIColor) {
        let searchBar = UISearchBar.appearance()

        searchBar.setImage(
            .init(.close2, size: .extraSmall)?
                .withTintColor(color, renderingMode: .alwaysTemplate),
            for: .clear,
            state: .normal
        )
        searchBar.setImage(
            .init(.search)?
                .withTintColor(color, renderingMode: .alwaysTemplate),
            for: .search,
            state: .normal
        )
        searchBar.backgroundImage = .init()

        let searchTextField = UISearchTextField.appearance()
        searchTextField.layer.cornerRadius = 20
        searchTextField.clipsToBounds = true
        searchTextField.borderStyle = .none
    }
}
