//
//  HomeSelectionRankedView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 20/12/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

/// Present the list of ranked movies regarding custom begin/end dates.
struct HomeSelectionRankedView: View {
    // MARK: - Internal Properties
    var repository: MoviesRepository
    var countryCode: ApiCountryCode? = nil
    @Binding var apiError: MErrorType?
    
    var beginDate: String?
    var endDate: String?
    
    // MARK: - Private Properties
    @State private var inProgress: Bool = false
    @State private var dataSource: [ApiMovie] = []
    
    // MARK: - View
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: MPadding.small) {
                ForEach(Array(dataSource.enumerated()), id: \.offset) { index, movie in
                    if let backdrop = movie.backdrop {
                        ZStack {
                            AsyncImage(url: ImageManager().backdropImageURL(path: backdrop, size: .w300),
                                       content: { image in
                                HStack(alignment: .top, spacing: MPadding.infime) {
                                    Spacer()
                                    MText(text: "\(index+1)", font: .title, alignment: .trailing)
                                    VStack(alignment: .leading, spacing: MPadding.tiny) {
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(.rect(cornerRadius: MPadding.tiny))
                                        Divider()
                                            .background(MColor.Common.lightGreen)
                                            .frame(width: 60.0)
                                        HStack(alignment: .top) {
                                            VStack(alignment: .leading) {
                                                MText(text: movie.title, font: .paragraphSB, alignment: .leading)
                                                Spacer()
                                            }.frame(height: 46.0)
                                            Spacer()
                                        }
                                    }
                                    
                                }.frame(width: 260, alignment: .leading)
                            },
                                       placeholder: {
                                MProgressView(model: MProgressModel(), shouldShow: $inProgress)
                            })
                        }
                    }
                }
            }
        }.onAppear {
            setupDataSource()
        }.progress(model: MProgressModel(),
                   shouldShow: $inProgress)
    }
}

// MARK: - Private Funcs
private extension HomeSelectionRankedView {
    func setupDataSource() {
        inProgress = true
        repository.topRatedMoviesAtDates(beginDateString: beginDate, endDateString: endDate, countryCode: countryCode) { movies, error in
            inProgress = false
            if let error = error {
                apiError = ApiError(error: error).type
            } else if let apiMovies = movies?.results {
                dataSource = apiMovies
                    .filter { $0.backdrop != nil }
                    .sorted(by: { $0.voteAverage > $1.voteAverage })
            } else {
                apiError = .noData
            }
        }
    }
    
    func handleResponse(movies: ApiMovies?, error: Error?) {
        inProgress = false
        if let error = error {
            apiError = ApiError(error: error).type
        } else if let apiMovies = movies?.results {
            dataSource = apiMovies
                .filter { $0.backdrop != nil }
                .sorted(by: { $0.voteAverage > $1.voteAverage })
        } else {
            apiError = .noData
        }
    }
}

#Preview {
    HomeSelectionRankedView(repository: MoviesRepositoryImpl(), countryCode: .fr, apiError: .constant(nil))
}
