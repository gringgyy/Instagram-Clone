//
//  FeedCellViewModel.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 4/11/2564 BE.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        fetchUser()
    }
    
    func fetchUser() {
        Firestore.firestore().collection("users").document(post.ownerUID).getDocument { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.post.user = try? snap?.data(as: User.self)
        }
    }
}
