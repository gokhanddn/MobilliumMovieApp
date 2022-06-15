//
//  MovieDetailBuilder.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit

final class MovieDetailBuilder {
    
    private static let storyboardName: String = "MovieDetail"
    private static let controllerName: String = "MovieDetailViewController"
    
    static func make(with movieId: Int) -> MovieDetailViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName) as? MovieDetailViewController
        viewController?.viewModel = MovieDetailViewModel(service: app.movieService, movieId: movieId)
        return viewController
    }
}
