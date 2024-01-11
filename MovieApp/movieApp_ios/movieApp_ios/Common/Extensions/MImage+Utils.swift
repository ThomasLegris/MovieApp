//
//  MImage+Utils.swift
//  movieApp_ios
//
//  Created by Thomas Legris on 21/11/2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI

enum ImageConstants {
    static let baseUrl: String = "https://image.tmdb.org/t/p/"
    
    enum PosterSize: String {
        case w92
        case w154
        case w185
        case w342
        case w500
        case w780
        case original
    }
    
    enum BackdropSize: String {
        case w300
        case w780
        case w1280
        case original
    }
}

class ImageManager {
    func posterImageURL(path: String, size: ImageConstants.PosterSize) -> URL? {
        return URL(string: ImageConstants.baseUrl + size.rawValue + path)
    }
    
    func backdropImageURL(path: String, size: ImageConstants.BackdropSize) -> URL? {
        return URL(string: ImageConstants.baseUrl + size.rawValue + path)
    }
}
