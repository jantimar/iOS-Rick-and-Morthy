//
//  Style.swift
//  Style
//
//  Created by Jan Timar on 27.12.2024.
//

import SwiftUI

public protocol Style {
    var fonts: StyleFonts { get }
    var colors: StyleColors { get }
    var offsets: StyleOffsets { get }
}

public protocol StyleFonts {
    var headline1: Font { get }
    var headline2: Font { get }
    var headline3: Font { get }
    var large: Font { get }
    var medium: Font { get }
    var small: Font { get }
    var bottomNavigation: Font { get }
}

public protocol StyleColors {
    var accentPrimary: Color { get }
    var backgroundsPrimary: Color { get }
    var backgroundsSecondary: Color { get }
    var backgroundsTertiary: Color { get }
    var backgroundsBottomNavigation: Color { get }
    var foregroundsPrimary: Color { get }
    var foregroundsSecondary: Color { get }
    var foregroundsTertiary: Color { get }
    var foregroundsSeparator: Color { get }
    var foregroundsOnPrimary: Color { get }
    var iconsPrimary: Color { get }
    var iconsSecondary: Color { get }
    var iconsTertiary: Color { get }
}

public protocol StyleOffsets {
    var extraSmall: CGFloat { get }
    var small: CGFloat { get }
    var medium: CGFloat { get }
    var large: CGFloat { get }
    var extraLarge: CGFloat { get }
    var extraExtraLarge: CGFloat { get }
}
