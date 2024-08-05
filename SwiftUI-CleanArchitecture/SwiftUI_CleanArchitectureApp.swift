//
//  SwiftUI_CleanArchitectureApp.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Vishal Nandoriya on 05/08/24.
//

import SwiftUI

@main
struct SwiftUI_CleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            let userListViewModel = DependencyManager.shared.provideUserListViewModel()
            UserListView(viewModel: userListViewModel)
        }
    }
}
