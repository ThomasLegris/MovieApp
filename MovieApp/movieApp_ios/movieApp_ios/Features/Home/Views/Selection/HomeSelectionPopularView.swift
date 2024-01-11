//
//  HomeSelectionPopularView.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 21/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

/// Present the list of popular movies.
struct HomeSelectionPopularView: View {
    // MARK: - Internal Properties
    var repository: MoviesRepository
    var size: CGSize
    @Binding var apiError: MErrorType?
    
    // MARK: - Private Properties
    @State private var inProgress: Bool = false
    @State private var dataSource: [ApiMovie] = []
    
    // MARK: - Init
    init(repository: MoviesRepository, size: CGSize, apiError: Binding<MErrorType?>) {
        self.repository = repository
        self.size = size
        _apiError = apiError
    }
    
    // MARK: - View
    var body: some View {
        TabView() {
            ForEach(dataSource, id: \.self) { movie in
                if let backdrop = movie.backdrop {
                    VStack(alignment: .center) {
                        AsyncImage(
                            url: ImageManager().backdropImageURL(path: backdrop, size: .w780),
                            content: { image in
                                ZStack {
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: size.width)
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            SelectionMovieTitle(title: movie.title)
                                                .frame(width: size.width / 1.5,
                                                       alignment: .leading)
                                                .padding(.top, size.width / 2.5)
                                            Spacer()
                                        }
                                    }
                                }
                            },
                            placeholder: {
                                MProgressView(model: MProgressModel(), shouldShow: .constant(true))
                            }
                        )
                        Spacer()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        .progress(model: MProgressModel(),
                  shouldShow: $inProgress)
        .onAppear {
            self.initDataSource()
        }
    }
}

// MARK: - Private Funcs
private extension HomeSelectionPopularView {
    func initDataSource() {
        self.inProgress = true
        repository.popularMovies { movies, error in
            inProgress = false
            if let strongError = error {
                apiError = ApiError(error: strongError).type
            } else if let movies = movies?.results {
                self.dataSource = movies.filter { $0.backdrop != nil}
            } else {
                apiError = .noData
            }
        }
    }
}

#Preview {
    HomeSelectionPopularView(repository: MoviesRepositoryImpl(), size: CGSize(width: 300, height: 120), apiError: .constant(nil))
        .background(MColor.Common.background)
}
