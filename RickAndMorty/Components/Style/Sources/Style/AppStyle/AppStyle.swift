//
//  AppStyle.swift
//  Style
//
//  Created by Jan Timar on 27.12.2024.
//

import SwiftUI

public struct AppStyle: Style {
    public let fonts: StyleFonts
    public let colors: StyleColors
    public let offsets: StyleOffsets

    public init(
        fonts: StyleFonts? = nil,
        colors: StyleColors? = nil,
        offsets: StyleOffsets? = nil
    ) {
        self.fonts = fonts ?? AppStyleFonts()
        self.colors = colors ?? AppStyleColors()
        self.offsets = offsets ?? AppStyleOffsets()
    }
}
