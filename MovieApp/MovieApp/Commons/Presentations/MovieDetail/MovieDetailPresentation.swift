//
//  MovieDetailPresentation.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation

final class MovieDetailPresentation: NSObject {
    
    let title: String
    let overview: String
    let imageUrl: String
    let releaseDate: String
    let voteAverage: Double
    
    init(title: String, overview: String, imageUrl: String, releaseDate: String, voteAverage: Double) {
        self.title = title
        self.overview = overview
        self.imageUrl = imageUrl
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MovieDetailPresentation else { return false }
        return self.title == other.title && self.overview == other.overview && self.imageUrl == other.imageUrl && self.releaseDate == other.releaseDate
    }
}
