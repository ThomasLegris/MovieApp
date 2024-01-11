//
//  SelectionTitle.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 22/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

/// Shadowed title for movie displayed on poster
struct SelectionMovieTitle: View {
    // MARK: - Internal Properties
    var title: String
    
    // MARK: - View
    var body: some View {
        MText(text: title,
              font: .heading3,
              color: .white,
              alignment: .leading)
        .shadow(color: .black, radius: MPadding.tiny, x: 0, y: 0)
            .padding(MPadding.small)
            .background(
                RoundedRectangle(cornerRadius: MPadding.tiny)
                    .fill(
                        MColor.Common.background.opacity(0.02)
                        .shadow(.drop(color: .black, radius: MPadding.tiny, x: 0, y: 0))))
    }
}

#Preview {
    SelectionMovieTitle(title: "Exemple nom de film")
}
