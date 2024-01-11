//
//  HomeSelectionReleasesView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 22/12/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

/// Describes available release period.
enum ReleasePeriod {
    case now
    case upcomming
}

/// Display now and future realease movies in a scroll list.
struct HomeSelectionReleasesView: View {
    // MARK: - Internal Properties
    var repository: MoviesRepository
    var releasePeriod: ReleasePeriod
    @Binding var apiError: MErrorType?
    
    // MARK: - Private Properties
    @State private var inProgress: Bool = false
    @State private var dataSource: [ApiMovie] = []
    
    // MARK: - View
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: MPadding.infime) {
                ForEach(dataSource, id: \.self) { movie in
                    if let posterImageUrl = movie.poster {
                        AsyncImage(url: ImageManager().posterImageURL(path: posterImageUrl, size: .w154),
                                   content: { image in
                        image },
                                   placeholder: {
                            MProgressView(model: MProgressModel(), shouldShow: .constant(true))
                        })
                    }
                }
            }.progress(model: MProgressModel(),
                       shouldShow: $inProgress)
        }.onAppear {
            self.initDataSource()
        }
    }
}

// MARK: - Private Funcs
private extension HomeSelectionReleasesView {
    func initDataSource() {
        self.inProgress = true
        switch self.releasePeriod {
        case .now:
            repository.theaterMovies { movies, error in
                self.handleResponse(movies: movies, error: error)
            }
        case .upcomming:
            repository.upcomingMovies { movies, error in
                self.handleResponse(movies: movies, error: error)
            }
        }
    }
    
    func handleResponse(movies: ApiMovies?, error: Error?) {
        inProgress = false
        if let strongError = error {
            apiError = ApiError(error: strongError).type
        } else if let movies = movies?.results {
            self.dataSource = movies.filter { $0.poster != nil}
        } else {
            apiError = .noData
        }
    }
}

#Preview {
    HomeSelectionReleasesView(repository: MoviesRepositoryImpl(), releasePeriod: .now, apiError: .constant(nil))
}
