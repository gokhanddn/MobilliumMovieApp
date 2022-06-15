//
//  MovieService.swift
//  MovieAppService
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation
import Core
import Networking
import MovieAppModel

public class MovieService: BaseService, MovieServiceProtocol {
    
    public override init() {
        super.init()
    }
    
    public func getNowPlayingMovies(completion: @escaping CallbackResponse<MovieResponse>) {
        
        var dataRequest = DataRequest(urlString: ApiHost.production.rawValue, path: .movie, version: .v3)
        dataRequest.method = .get
        
        networking.request(with: dataRequest.getUrlRequest(with: "now_playing")) { (result: Result<MovieResponse>) in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    public func getUpcomingMovies(parameters: Parameters, completion: @escaping CallbackResponse<MovieResponse>) {
        
        var dataRequest = DataRequest(urlString: ApiHost.production.rawValue, path: .movie, version: .v3)
        dataRequest.method = .get
        dataRequest.params = parameters
        
        networking.request(with: dataRequest.getUrlRequest(with: "upcoming")) { (result: Result<MovieResponse>) in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    public func getMovieDetail(movieId: Int, completion: @escaping CallbackResponse<MovieDetailResponse>) {
        var dataRequest = DataRequest(urlString: ApiHost.production.rawValue, path: .movie, version: .v3)
        dataRequest.method = .get
        
        networking.request(with: dataRequest.getUrlRequest(with: "\(movieId)")) { (result: Result<MovieDetailResponse>) in
            switch result {
            case .success(let response):
                completion(response)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
