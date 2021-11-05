//
//  ProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 1/11/2564 BE.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkFollow()
        checkStats()
    }
    func changeProfileImage(image: UIImage) {
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            guard let uid = self.user.id else { return }
            Firestore.firestore().collection("users").document(uid).updateData([
                "profileImageURL": imageURL
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.user.updateProfileImageURL(url: imageURL)
            }
        }
    }
    
    func follow() {
        if let didFollow = user.didFollow, didFollow {
            return
        }
        guard let uid = user.id else { return }
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUID).collection("user-following").document(uid).setData([:]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("followers").document(uid).collection("user-follwers").document(uid).setData([:]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                NotificationsViewModel.sendNotification(withUID: uid, type: .follow)
                self.user.didFollow = true
            }
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUID).collection("user-following").document(uid).delete() { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("followers").document(uid).collection("user-follwers").document(uid).delete() { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.user.didFollow = false
            }
        }
    }
    
    func checkFollow() {
        guard let uid = user.id else { return }
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUID).collection("user-following").document(uid).getDocument { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let didFollow = snap?.exists else { return }
            
            self.user.didFollow = didFollow
        }
    }
    
    func checkStats() {
        guard let uid = user.id else { return }
        
        Firestore.firestore().collection("followers").document(uid).collection("user-follower").getDocuments { (snap , error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let followers = snap?.documents.count else { return }
            
            Firestore.firestore().collection("following").document(uid).collection("user-following").getDocuments { (snap , error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let following = snap?.documents.count else { return }
                
                Firestore.firestore().collection("posts").whereField("ownerUID", isEqualTo: uid).getDocuments { (snap , error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    guard let posts = snap?.documents.count else { return }
                    
                    self.user.stats = UserStatsData(following: following, followers: followers, posts: posts)
                }
            }
        }
    }
}

