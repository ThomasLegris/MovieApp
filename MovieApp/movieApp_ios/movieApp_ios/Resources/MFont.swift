//
//  MFont.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 18/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

enum MFont {
    /// 56 B
    case title
    /// 24 B
    case heading1
    /// 21 B
    case heading2
    /// 18 SB
    case heading3
    /// 16 Regular
    case heading4
    /// 16 SB
    case heading4SB
    /// 14 B
    case paragraphB
    /// 14 SB
    case paragraphSB
    /// 14
    case paragraph
    /// 12
    case smallParagraphB
    /// 12 B
    case smallParagraphSB
    /// 12 SB
    case smallParagraph
    /// 12 Italic
    case smallParagraphIta
    /// 10
    case tiny
    
    /// Returns SwiftUI Text's Font.
    var font: Font {
        
        switch self {
        case .title:
            return Font.custom("SFProDisplay-Bold", size: 56)
        case .heading1:
            return Font.custom("SFProDisplay-Bold", size: 24)
        case .heading2:
            return Font.custom("SFProDisplay-Bold", size: 21)
        case .heading3:
            return Font.custom("SFProDisplay-SemiBold", size: 18)
        case .heading4:
            return Font.custom("SFProDisplay-Regular", size: 16)
        case .heading4SB:
            return Font.custom("SFProDisplay-SemiBold", size: 16)
        case .paragraphSB:
            return Font.custom("SFProDisplay-SemiBold", size: 14)
        case .paragraph:
            return Font.custom("SFProDisplay-Regular", size: 14)
        case .paragraphB:
            return Font.custom("SFProDisplay-Bold", size: 14)
        case .smallParagraph:
            return Font.custom("SFProDisplay-Regular", size: 12)
        case .smallParagraphB:
            return Font.custom("SFProDisplay-Bold", size: 12)
        case .smallParagraphSB:
            return Font.custom("SFProDisplay-SemiBold", size: 12)
        case .smallParagraphIta:
            return Font.custom("SFProDisplay-LightItalic", size: 12)
        case .tiny:
            return Font.custom("SFProDisplay-Regular", size: 10)
        }
    }
}
