//
//  HomeView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 11/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

/// Home view which load content according to tab bar selection.
struct HomeView: View {
    // MARK: - View
    var body: some View {
        TabView {
            ForEach(TabItem.allCases, id: \.self) { tab in
                HomeContentView(tabItem: tab).tabItem {
                    Label(tab.title, image: tab.imgName)
                }
            }
        }.accentColor(MColor.Common.lightGreen)
    }
}

#Preview {
    HomeView()
}

