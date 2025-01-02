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
    public static func setupAppearance() {
            let searchBar = UISearchBar.appearance()

            searchBar.setImage(
                .init(.close2, size: .extraSmall),
                for: .clear,
                state: .normal
            )
            searchBar.setImage(
                .init(.search),
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
