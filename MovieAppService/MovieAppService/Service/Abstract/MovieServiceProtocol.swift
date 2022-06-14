//
//  MovieServiceProtocol.swift
//  MovieAppService
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation
import Core
import MovieAppModel

public protocol MovieServiceProtocol {
    func getNowPlayingMovies(parameters: Parameters, completion: @escaping CallbackResponse<MovieResponse>)
    func getUpcomingMovies(parameters: Parameters, completion: @escaping CallbackResponse<MovieResponse>)
}