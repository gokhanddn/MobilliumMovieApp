//
//  DataRequestProtocol.swift
//  Networking
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation
import Core

public protocol DataRequestProtocol {
    var urlString: String { get }
    var method: HTTPMethod { get }
    var headers: HeaderParameters { get }
    var params: Parameters? { get }
    var httpBody: Data? { get }
}
