//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import Foundation
import Core
import MovieAppService
import struct MovieAppModel.MovieResultModel

final class MovieListViewModel: MovieListViewModelProtocol {
    
    // MARK: - Properties
    var delegate: MovieListViewModelDelegate?
    private let service: MovieServiceProtocol
    private var movieList: [MovieResultModel] = []
    private var totalResult: Int = 0
    
    // MARK: - Init
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    // MARK: Protocol Methods
    func load(in page: Int) {
        notify(.setLoading(true))
        
        let params: Parameters = [
            Constants.ParameterKeys.page: page
        ]
        
        service.getUpcomingMovies(parameters: params) { [weak self] resp in
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            if let resp = resp {
               if let movies = resp.results {
                   self.totalResult = resp.totalResults ?? 0
                   self.movieList.append(contentsOf: movies)
               }
            } else {
                self.totalResult = self.movieList.count
            }
            
            let presenatations = self.movieList.map({ UpcomingMoviePresentation(movie: $0) })
            self.notify(.showUpcomingMovieList(presenatations))
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movieList[index]
        delegate?.navigate(to: .detail(movie.id ?? 0))
    }
    
    func isLoadingMoreVisible() -> Bool {
        return !movieList.isEmpty && movieList.count < totalResult
    }
    
    // MARK: Private Methods
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
