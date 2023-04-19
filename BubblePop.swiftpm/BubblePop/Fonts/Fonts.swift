//
//  Fonts.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 18/04/23.
//

import SwiftUI
import Foundation

class Fonts: ObservableObject {
    func getFont(weight: String, size: CGFloat) -> Font {
        let cfURL = Bundle.main.url(forResource: "Poppin", withExtension: "ttf")! as CFURL

        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

        let uiFont = UIFont(name: "Poppin)", size:  size)

        return Font(uiFont ?? UIFont())
    }
}
