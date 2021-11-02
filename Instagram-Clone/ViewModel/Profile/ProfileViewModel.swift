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
    }
    func changeProfileImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            ref.downloadURL { (url, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let imageURL = url?.absoluteString else { return }
                
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
    }
}
