//
//  FetchUsersUseCase.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

protocol FetchUsersUseCase {
    func execute() async throws -> [User]
}

class DefaultFetchUsersUseCase: FetchUsersUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        return try await userRepository.fetchUsers()
    }
}
