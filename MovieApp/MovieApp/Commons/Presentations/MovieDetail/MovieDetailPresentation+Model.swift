//
//  MovieDetailPresentation+Model.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation
import struct MovieAppModel.MovieDetailResponse

extension MovieDetailPresentation {
    
    convenience init(movieDetail: MovieDetailResponse) {
        self.init(
            title: movieDetail.title ?? String(),
            overview: movieDetail.overview ?? String(),
            imageUrl: Util.getImageUrl(posterPath: movieDetail.posterPath ?? String()),
            releaseDate: movieDetail.releaseDate ?? String(),
            voteAverage: movieDetail.voteAverage ?? 0
        )
    }
}
