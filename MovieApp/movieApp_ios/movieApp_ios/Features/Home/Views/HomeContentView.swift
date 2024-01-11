//
//  HomeContentView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 13/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

/// Dispatch all tab content.
struct HomeContentView: View {
    // MARK: - Internal Properties
    var tabItem: TabItem
    
    // MARK: - Private Properties
    private let repository: MoviesRepository = MoviesRepositoryImpl()
    
    // MARK: - View
    var body: some View {
        switch tabItem {
        case .home:
            HomeSelectionsView(repository: repository)
        case .categories:
            DevInProgressView()
        case .search:
            DevInProgressView()
        }
    }
}

// TODO: Will be removed when features are ready.
struct DevInProgressView: View {
    var body: some View {
        VStack(spacing: 24.0) {
            Spacer().frame(height: 200.0)
            Image("ic_build_in_progress")
            Text("Développement en cours ..")
                .font(MFont.heading3.font)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
            
        }.background(Color.clear)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("background"))
            .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    HomeContentView(tabItem: .home)
}
