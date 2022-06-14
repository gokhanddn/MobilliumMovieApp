//
//  Result.swift
//  Core
//
//  Created by GOKHAN on 14.06.2022.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}
