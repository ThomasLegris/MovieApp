//
//  MProgressView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 21/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

/// Custom progress view with movie style.
struct MProgressView: View {
    // MARK: - Internal Properties
    var model: MProgressModel
    
    @Binding var shouldShow: Bool
    
    // MARK: - View
    var body: some View {
        if shouldShow {
            ProgressView() {
                model.bottomText.lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            .progressViewStyle(CircularProgressViewStyle(tint: model.progressColor))
            .frame(width: model.bgWidth, height: model.bgHeight, alignment: .center)
            .padding(4.0)
            .background(model.bgColor)
            .cornerRadius(model.cornerRadius)
        }
    }
}

#Preview {
    MProgressView(model: MProgressModel(bottomText: MText(text: "Affichage en cours",
                                                          font: MFont.paragraph,
                                                          color: MColor.Common.lightGreen,
                                                          alignment: .center),
                                        progressColor: MColor.Common.lightGreen,
                                        bgColor: MColor.Common.background,
                                        cornerRadius: 9.0),
                  shouldShow: .constant(true))
}
