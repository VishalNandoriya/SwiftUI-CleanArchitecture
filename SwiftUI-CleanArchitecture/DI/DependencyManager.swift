//
//  DependencyManager.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

import Foundation

class DependencyManager {
    static let shared = DependencyManager()
    
    private init() {}
    
     func provideUserListViewModel() -> UserListViewModel {
        let apiService = APIService()
        let userRepository = DefaultUserRepository(apiService: apiService)
        let fetchUsersUseCase = DefaultFetchUsersUseCase(userRepository: userRepository)
        return UserListViewModel(fetchUsersUseCase: fetchUsersUseCase)
    }
}
