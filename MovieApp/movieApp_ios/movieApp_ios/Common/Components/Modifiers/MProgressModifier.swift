//
//  MProgressModifier.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 22/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

/// Modifier which is apply to any swiftui view.
struct MProgressModifier: ViewModifier {
    // MARK: - Internal Propertis
    var model: MProgressModel
    @Binding var shouldShow: Bool
    
    // MARK: - View
    func body(content: Content) -> some View {
        ZStack {
            content
            MProgressView(model: model, shouldShow: _shouldShow)
        }
    }
}
