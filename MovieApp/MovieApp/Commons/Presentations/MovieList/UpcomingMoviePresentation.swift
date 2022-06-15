//
//  UpcomingMoviePresentation.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation

final class UpcomingMoviePresentation: NSObject {
    
    let title: String
    let overview: String
    let imageUrl: String
    let releaseDate: String
    
    init(title: String, overview: String, imageUrl: String, releaseDate: String) {
        self.title = title
        self.overview = overview
        self.imageUrl = imageUrl
        self.releaseDate = releaseDate
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? UpcomingMoviePresentation else { return false }
        return self.title == other.title && self.overview == other.overview && self.imageUrl == other.imageUrl && self.releaseDate == other.releaseDate
    }
}
