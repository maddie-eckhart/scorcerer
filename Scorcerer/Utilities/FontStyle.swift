//
//  FontStyle.swift
//  Scorcerer
//
//  Created by Madeline Eckhart on 6/20/24.
//

import SwiftUI

enum FontWeight {
    case title
    case regular
    case bold
}

enum FontSize: CGFloat {
    case xlarge = 75
    case large = 32
    case medium = 26
    case small = 18
}

extension Font {
    static let fontStyle: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .title:
            Font.custom("Didot", size: size).bold()
        case .regular:
            Font.custom("Tahoma", size: size)
        case .bold:
            Font.custom("Tahoma Bold", size: size)
        }
    }
}

extension Text {
    func fontStyle(_ fontWeight: FontWeight? = .regular, _ size: FontSize? = .medium) -> Text {
        return self.font(.fontStyle(fontWeight ?? .regular, size?.rawValue ?? 16))
    }
}
