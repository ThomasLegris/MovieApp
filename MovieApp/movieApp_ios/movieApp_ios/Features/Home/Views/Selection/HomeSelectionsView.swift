//
//  HomeSelectionsView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 19/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared
import Combine

/// View which display several selections of movies.
struct HomeSelectionsView: View {
    // MARK: - Internal Properties
    var repository: MoviesRepository
    @State private var apiError: MErrorType?
    
    // MARK: - View
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: MPadding.huge) {
                    // Popular movies.
                    VStack(alignment: .leading, spacing: MPadding.small) {
                        MText(text: "Films populaires", font: .heading2, color: .white, alignment: .leading)
                            .padding(.leading, MPadding.high)
                        HomeSelectionPopularView(repository: repository, size: geometry.size, apiError: $apiError)
                            .frame(height: 260)
                    }
                    // Now in theater release.
                    VStack(alignment: .leading, spacing: MPadding.small) {
                        MText(text: "Actuellement au cinéma", font: .heading2, color: .white, alignment: .leading)
                            .padding(.leading, MPadding.high)
                        HomeSelectionReleasesView(repository: repository, releasePeriod: .now, apiError: $apiError)
                    }
                    // Future release.
                    VStack(alignment: .leading, spacing: MPadding.small) {
                        MText(text: "Prochaines sorties cinéma", font: .heading2, color: .white, alignment: .leading)
                            .padding(.leading, MPadding.high)
                        HomeSelectionReleasesView(repository: repository, releasePeriod: .upcomming, apiError: $apiError)
                    }
                    // 2023 top rated movies.
                    VStack(alignment: .leading, spacing: MPadding.small) {
                        MText(text: "Meilleurs films mondial - 2023", font: .heading2, color: .white, alignment: .leading)
                            .padding(.leading, MPadding.high)
                        HomeSelectionRankedView(repository: repository, apiError: $apiError, beginDate: "2023-01-01", endDate: "2023-12-31")
                    }
                    // 2023 French top rated movies.
                    VStack(alignment: .leading, spacing: MPadding.small) {
                        MText(text: "Meilleurs films français - 2023", font: .heading2, color: .white, alignment: .leading)
                            .padding(.leading, MPadding.high)
                        HomeSelectionRankedView(repository: repository, countryCode: ApiCountryCode.fr, apiError: $apiError, beginDate: "2023-01-01", endDate: "2023-12-31")
                    }
                    // All time top rated movies.
                    VStack(alignment: .leading, spacing: MPadding.small) {
                        MText(text: "Meilleurs films de tous les temps", font: .heading2, color: .white, alignment: .leading)
                            .padding(.leading, MPadding.high)
                        HomeSelectionRankedView(repository: repository, apiError: $apiError)
                        
                    }
                    Spacer()
                }.padding(.top, MPadding.high)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MColor.Common.background)
            .alert(item: $apiError) { _ in
                Alert(title: Text("Erreur lors de la récupération des informations de films"), message: Text(apiError?.title ?? ""))
            }
        }
    }
}

#Preview {
    HomeSelectionsView(repository: MoviesRepositoryImpl())
}
