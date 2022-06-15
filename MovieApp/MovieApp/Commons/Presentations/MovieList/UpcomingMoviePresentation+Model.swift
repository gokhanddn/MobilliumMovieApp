//
//  UpcomingMoviePresentation+Model.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation
import struct MovieAppModel.MovieResultModel

extension UpcomingMoviePresentation {
    
    convenience init(movie: MovieResultModel) {
        self.init(
            title: movie.title ?? String(),
            overview: movie.overview ?? String(),
            imageUrl: Util.getImageUrl(posterPath: movie.posterPath ?? String()),
            releaseDate: movie.releaseDate ?? String()
        )
    }
}
