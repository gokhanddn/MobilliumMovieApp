//
//  NowPlayingMoviePresentation.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation

final class NowPlayingMoviePresentation: NSObject {
    
    let title: String
    let overview: String
    let imageUrl: String
    
    init(title: String, overview: String, imageUrl: String) {
        self.title = title
        self.overview = overview
        self.imageUrl = imageUrl
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? NowPlayingMoviePresentation else { return false }
        return self.title == other.title && self.overview == other.overview && self.imageUrl == other.imageUrl
    }
}
