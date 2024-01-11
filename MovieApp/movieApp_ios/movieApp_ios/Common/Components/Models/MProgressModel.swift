//
//  MProgressModel.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 21/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

/// Describe Data for `MProgressView`
struct MProgressModel {
    /// Text to apply at the bottom of the progress circle.
    var bottomText: MText?
    /// Color of progress view.
    var progressColor: Color = MColor.Common.lightGreen
    /// Color of the background view.
    var bgColor: Color = .clear
    /// Background view corner radius.
    var cornerRadius: CGFloat = 0.0
    /// Background view width
    var bgWidth: CGFloat = 64.0
    /// Background view height
    var bgHeight: CGFloat = 64.0
}
