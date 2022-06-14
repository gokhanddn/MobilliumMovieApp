//
//  DataRequest.swift
//  MovieAppService
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation
import Core
import Networking

struct DataRequest: DataRequestProtocol {
    
    var urlString: String
    var method: HTTPMethod = .get
    var path: Path
    var headers: HeaderParameters = [:]
    var params: Parameters?
    var httpBody: Data?
    var version: ApiVersion?
    
    init(urlString: String, path: Path, version: ApiVersion? = nil) {
        self.urlString = urlString
        self.path = path
        self.version = version
    }
    
    func getUrlRequest(with endpoint: String) -> URLRequest {
        var request = URLRequest(url: getUrl(with: endpoint))
        request.httpMethod = method.rawValue
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 60
        request.allHTTPHeaderFields = headers
        request.httpBody = httpBody
        return request
    }
    
    private func getUrl(with endpoint: String) -> URL {
        var components = URLComponents(string: getUrlString(with: endpoint))
        components?.queryItems = getParams()
        return components?.url ?? URL(string: urlString)!
    }
    
    private func getUrlString(with endpoint: String) -> String {
        var path = "\(path.rawValue)/\(endpoint)"
        if let version = version {
            path = "\(version.rawValue)/\(path)"
        }
        path = "\(urlString)/\(path)"
        return path
    }
    
    private func getParams() -> [URLQueryItem]? {
        var pParams: Parameters = [:]
        
        if let params = params {
            pParams = params
        }
        
        pParams[ParameterKey.apiKey] = ParameterValue.apiKey
        
        if method == .get {
            var urlParamList: [URLQueryItem] = []
            for param in pParams {
                urlParamList.append(URLQueryItem(name: param.key, value: unwrap(value: param.value)))
            }
            return urlParamList.count > 0 ? urlParamList : nil
        }
        return nil
    }
    
    private func unwrap(value: Any) -> String {
        let mirror = Mirror(reflecting: value)
        if mirror.displayStyle != .optional {
            return String(describing: value)
        }
        
        if let some = mirror.children.first?.value {
            return String(describing: some)
        }
        return String()
    }
}
