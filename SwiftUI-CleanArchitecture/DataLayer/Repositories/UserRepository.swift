//
//  UserRepository.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

protocol UserRepository {
    func fetchUsers() async throws -> [User]
}

class DefaultUserRepository: UserRepository {
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchUsers() async throws -> [User] {
        return try await apiService.getUsers()
    }
}
