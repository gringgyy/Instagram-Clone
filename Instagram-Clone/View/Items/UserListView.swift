//
//  UserListView.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 22/10/2564 BE.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { _ in
                    UserCell()
                        .padding(.leading, 8)
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
