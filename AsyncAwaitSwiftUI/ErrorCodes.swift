//
//  ErrorCodes.swift
//  AsyncAwaitSwiftUI
//
//  Created by Harish Kshirsagar on 03/09/24.
//

import Foundation

enum ErrorCode: LocalizedError {
    case invalidURL
    case invalidData
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL found"
        case .invalidData:
            return "Invalid Data found"
        case .invalidResponse:
            return "Invalid Response found"
        }
    }
}
