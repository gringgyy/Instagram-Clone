//
//  UserListView.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 22/10/2564 BE.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        searchText.isEmpty ? viewModel.users : viewModel.filterUsers(withText: searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(destination: ProfileView(user: user))
                    UserCell(user: user)
                        .padding(.leading, 8)
                }
            }
        }
    }
}
