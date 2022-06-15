//
//  AppContainer.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation
import MovieAppService

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let movieService = MovieService()
}
