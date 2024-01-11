//
//  View+Modifier.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 22/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

extension View {
    func progress(model: MProgressModel,
                  shouldShow: Binding<Bool>) -> some View {
        return modifier(MProgressModifier(model: model, shouldShow: shouldShow))
    }
}
