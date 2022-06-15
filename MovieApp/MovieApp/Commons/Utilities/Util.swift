//
//  Util.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation

final class Util {
    static func getImageUrl(posterPath: String) -> String {
        return "\(Constants.PosterPath.prefix)\(posterPath)"
    }
}
