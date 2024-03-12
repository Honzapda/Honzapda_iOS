//
//  Font+.swift
//  Honzapda
//
//  Created by YOUJIM on 3/12/24.
//

import SwiftUI


extension Font {
    enum SCoreDream {
        case thin
        case extraLight
        case light
        case regular
        case medium
        case bold
        case extrabold
        case heavy
        case black
        
        var name: String {
            switch self {
            case .thin:
                return "S-CoreDream-1Thin"
            case .extraLight:
                return "S-CoreDream-2ExtraLight"
            case .light:
                return "S-CoreDream-3Light"
            case .regular:
                return "S-CoreDream-4Regular"
            case .medium:
                return "S-CoreDream-5Medium"
            case .bold:
                return "S-CoreDream-6Bold"
            case .extrabold:
                return "S-CoreDream-7ExtraBold"
            case .heavy:
                return "S-CoreDream-8Heavy"
            case .black:
                return "S-CoreDream-9Black"
            }
        }
    }
    
    static func scoreDream(_ weight: SCoreDream, size: CGFloat) -> Font {
        return .custom(weight.name, size: size)
    }
}
