//
//  MovieListContracts.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation
import MovieAppModel

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load(in page: Int)
    func selectMovie(at index: Int)
    func isLoadingMoreVisible() -> Bool
}

enum MovieListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showNowPlayingMovieList([NowPlayingMoviePresentation])
    case showUpcomingMovieList([UpcomingMoviePresentation])
}

enum MovieListViewRoute {
    case detail(Int)
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}
