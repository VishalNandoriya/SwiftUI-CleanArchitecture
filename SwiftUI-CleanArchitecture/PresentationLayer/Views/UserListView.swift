//
//  UserListView.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel: UserListViewModel
    
    init(viewModel: UserListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Fetching...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    List(viewModel.users) { user in
                        VStack(alignment: .leading) {
                            Text(user.name).font(.headline)
                            Text(user.email).font(.subheadline)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchUsers()
            }
            .navigationTitle("Users")
        }
    }
}
