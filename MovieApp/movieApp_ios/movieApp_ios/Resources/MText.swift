//
//  MText.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 19/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

/// Custom Text for Movie App.
struct MText: View {
    var text: String
    var font: MFont
    var color: Color
    var alignment: TextAlignment
    
    init(text: String,
         font: MFont = .paragraph,
         color: Color = .white,
         alignment: TextAlignment = .leading) {
        self.text = text
        self.font = font
        self.color = color
        self.alignment = alignment
    }
    
    var body: some View {
        Text(text)
            .font(font.font)
            .foregroundColor(color)
            .multilineTextAlignment(alignment)
    }
}
