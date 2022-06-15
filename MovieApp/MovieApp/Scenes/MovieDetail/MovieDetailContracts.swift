//
//  MovieDetailContracts.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}

enum MovieDetailViewModelOutput: Equatable {
    case setLoading(Bool)
    case updateTitle(String)
    case showMovieDetail(MovieDetailPresentation)
}

protocol MovieDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieDetailViewModelOutput)
}
