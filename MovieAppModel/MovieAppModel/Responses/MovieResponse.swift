//
//  MovieResponse.swift
//  MovieAppModel
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation

public struct MovieResponse: Decodable {
    public let page: Int?
    public let results: [MovieResultModel]?
    public let totalPages: Int?
    public let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
