//
//  Post.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 3/11/2564 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Post: Decodable, Identifiable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let likes: Int
    let imageURL: String
    let ownerUID: String
    let ownerImageURL: String
    let ownerUsername: String
    
    var user: User?
}
