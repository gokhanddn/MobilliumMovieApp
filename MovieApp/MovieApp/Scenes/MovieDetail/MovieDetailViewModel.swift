//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation
import Core
import MovieAppService
import struct MovieAppModel.MovieDetailResponse

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    // MARK: - Properties
    var delegate: MovieDetailViewModelDelegate?
    private let service: MovieServiceProtocol
    private let movieId: Int
    
    // MARK: - Init
    init(service: MovieServiceProtocol, movieId: Int) {
        self.service = service
        self.movieId = movieId
    }
    
    // MARK: Protocol Methods
    func load() {
        notify(.setLoading(true))
        
        service.getMovieDetail(movieId: movieId) { [weak self] resp in
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            if let resp = resp {
                let presenatation = MovieDetailPresentation(movieDetail: resp)
                self.notify(.updateTitle(presenatation.title))
                self.notify(.showMovieDetail(presenatation))
            }
        }
    }
    
    // MARK: Private Methods
    private func notify(_ output: MovieDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
