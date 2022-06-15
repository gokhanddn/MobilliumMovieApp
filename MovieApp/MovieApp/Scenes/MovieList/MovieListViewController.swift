//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit

final class MovieListViewController: BaseViewController {
    
    // MARK: - Properties
    /// View Models
    var viewModel: MovieListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - MovieListViewModelDelegate
extension MovieListViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            print("isLoading \(isLoading)")
        case .showNowPlayingMovieList(let nowPlayingMovieList):
            print("nowPlayingMovieList \(nowPlayingMovieList)")
        case .showUpcomingMovieList(let upcomingMovieList):
            print("upcomingMovieList \(upcomingMovieList)")
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let movieId):
            print("detail \(movieId)")
        }
    }
}
