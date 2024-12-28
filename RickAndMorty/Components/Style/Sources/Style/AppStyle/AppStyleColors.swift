//
//  AppStyleColors.swift
//  Style
//
//  Created by Jan Timar on 27.12.2024.
//

import SwiftUI

public struct AppStyleColors: StyleColors {
    public let accentPrimary: Color

    public let backgroundsPrimary: Color
    public let backgroundsSecondary: Color
    public let backgroundsTertiary: Color
    public let backgroundsBottomNavigation: Color

    public let foregroundsPrimary: Color
    public let foregroundsSecondary: Color
    public let foregroundsTertiary: Color
    public let foregroundsSeparator: Color
    public let foregroundsOnPrimary: Color

    public let iconsPrimary: Color
    public let iconsSecondary: Color
    public let iconsTertiary: Color

    public init(
        accentPrimary: Color? = nil,
        backgroundsPrimary: Color? = nil,
        backgroundsSecondary: Color? = nil,
        backgroundsTertiary: Color? = nil,
        backgroundsBottomNavigation: Color? = nil,
        foregroundsPrimary: Color? = nil,
        foregroundsSecondary: Color? = nil,
        foregroundsTertiary: Color? = nil,
        foregroundsSeparator: Color? = nil,
        foregroundsOnPrimary: Color? = nil,
        iconsPrimary: Color? = nil,
        iconsSecondary: Color? = nil,
        iconsTertiary: Color? = nil
    ) {
        self.accentPrimary = accentPrimary ?? Color("accentPrimary")
        self.backgroundsPrimary = backgroundsPrimary ?? Color("backgroundsPrimary")
        self.backgroundsSecondary = backgroundsSecondary ?? Color("backgroundsSecondary")
        self.backgroundsTertiary = backgroundsTertiary ?? Color("backgroundsTertiary")
        self.backgroundsBottomNavigation = backgroundsBottomNavigation ?? Color("backgroundsBottomNavigation")
        self.foregroundsPrimary = foregroundsPrimary ?? Color("foregroundsPrimary")
        self.foregroundsSecondary = foregroundsSecondary ?? Color("foregroundsSecondary")
        self.foregroundsTertiary = foregroundsTertiary ?? Color("foregroundsTertiary")
        self.foregroundsSeparator = foregroundsSeparator ?? Color("foregroundsSeparator")
        self.foregroundsOnPrimary = foregroundsOnPrimary ?? Color("foregroundsOnPrimary")
        self.iconsPrimary = iconsPrimary ?? Color("iconsPrimary")
        self.iconsSecondary = iconsSecondary ?? Color("iconsSecondary")
        self.iconsTertiary = iconsTertiary ?? Color("iconsTertiary")
    }
}
