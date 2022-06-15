//
//  Constants.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation

final class Constants {
    
    // MARK: - PosterPath
    struct PosterPath {
        static let prefix = "https://image.tmdb.org/t/p/w500"
    }
    
    // MARK: - ParameterKeys
    struct ParameterKeys {
        static let page = "page"
    }
    
    // MARK: - ReuseIdentifiers
    struct ReuseIdentifiers {
        static let movieCell = "MovieCell"
        static let loadingMore = "LoadingMoreFooterView"
        static let sliderHeaderView = "SliderHeaderView"
        static let sliderCell = "SliderCell"
    }
}
