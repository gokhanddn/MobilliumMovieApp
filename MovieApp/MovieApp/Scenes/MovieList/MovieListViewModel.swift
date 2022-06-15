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
    private var nowPlayingMovieList: [MovieResultModel] = []
    private var upcomingMovieList: [MovieResultModel] = []
    private var totalResult: Int = 0
    
    // MARK: - Init
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    // MARK: Protocol Methods
    func loadNowPlayingMovies() {
        notify(.setLoading(true))
        
        service.getNowPlayingMovies { [weak self] resp in
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            if let resp = resp {
               if let movies = resp.results {
                   self.nowPlayingMovieList.append(contentsOf: movies.shuffled().prefix(5))
               }
            }
            
            let presenatations = self.nowPlayingMovieList.map({ NowPlayingMoviePresentation(movie: $0) })
            self.notify(.showNowPlayingMovieList(presenatations))
        }
    }
    
    func loadUpcomingMovies(in page: Int) {
        notify(.setLoading(true))
        
        let params: Parameters = [
            Constants.ParameterKeys.page: page
        ]
        
        if page == 1 {
            upcomingMovieList.removeAll()
        }
        
        service.getUpcomingMovies(parameters: params) { [weak self] resp in
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            if let resp = resp {
               if let movies = resp.results {
                   self.totalResult = resp.totalResults ?? 0
                   self.upcomingMovieList.append(contentsOf: movies)
               }
            } else {
                self.totalResult = self.upcomingMovieList.count
            }
            
            let presenatations = self.upcomingMovieList.map({ UpcomingMoviePresentation(movie: $0) })
            self.notify(.showUpcomingMovieList(presenatations))
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = upcomingMovieList[index]
        delegate?.navigate(to: .detail(movie.id ?? 0))
    }
    
    func isLoadingMoreVisible() -> Bool {
        return !upcomingMovieList.isEmpty && upcomingMovieList.count < totalResult
    }
    
    // MARK: Private Methods
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
