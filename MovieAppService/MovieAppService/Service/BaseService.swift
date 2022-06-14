//
//  BaseService.swift
//  MovieAppService
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation
import Networking

public class BaseService {
    
    let networking: NetworkServiceProtocol
    
    public init() {
        networking = NetworkService()
    }
}
