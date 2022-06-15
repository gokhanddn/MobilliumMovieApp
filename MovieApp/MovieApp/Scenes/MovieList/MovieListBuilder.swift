//
//  MovieListBuilder.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit

final class MovieListBuilder {
    
    private static let storyboardName: String = "MovieList"
    private static let controllerName: String = "MovieListViewController"
    
    static func make() -> MovieListViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName) as? MovieListViewController
        viewController?.viewModel = MovieListViewModel(service: app.movieService)
        return viewController
    }
}
