//
//  Networking.swift
//  AsyncAwaitSwiftUI
//
//  Created by Harish Kshirsagar on 03/09/24.
//

import Foundation

final class Networking {
    
    static func getProducts() async throws -> [Users] {
        
        guard let url = URL(string: "https://api.github.com/users/vojtajina/followers?per_page=100") else {
            throw ErrorCode.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorCode.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Users].self, from: data)
        } catch {
            throw ErrorCode.invalidData
        }
        
    }

}

