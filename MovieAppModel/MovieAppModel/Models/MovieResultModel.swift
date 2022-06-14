//
//  MovieResultModel.swift
//  MovieAppModel
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation

public struct MovieResultModel: Decodable {
    public let id: Int?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String?
    public let voteAverage: Double?
    public let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
