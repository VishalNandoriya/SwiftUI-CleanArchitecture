//
//  UserViewModel.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

import SwiftUI

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let fetchUsersUseCase: FetchUsersUseCase
    
    init(fetchUsersUseCase: FetchUsersUseCase) {
        self.fetchUsersUseCase = fetchUsersUseCase
    }
    
    func fetchUsers() {
        isLoading = true
        Task {
            do {
                let fetchedUsers = try await fetchUsersUseCase.execute()
                await MainActor.run {
                    self.users = fetchedUsers
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}
