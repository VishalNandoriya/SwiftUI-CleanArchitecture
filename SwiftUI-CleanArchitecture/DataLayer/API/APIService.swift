//
//  APIService.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

import Foundation

class APIService {
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "\(baseURL)/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }
}
