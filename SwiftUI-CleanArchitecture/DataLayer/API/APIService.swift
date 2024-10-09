//
//  APIService.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

enum Keys {
    static let baseUrl = "https://jsonplaceholder.typicode.com/users"
}

class APIService {
    
    func getUsers() async throws -> [User] {
        return try await fetchData(from: "\(Keys.baseUrl)/users")
    }
    
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.invalidData
        }
        
    }
}
