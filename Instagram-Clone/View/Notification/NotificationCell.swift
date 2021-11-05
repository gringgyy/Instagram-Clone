//
//  NotificationCell.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 22/10/2564 BE.
//

import SwiftUI
import Kingfisher
struct NotificationCell: View {
    let notification: Notification
    
    var body: some View {
        HStack {
            if let imageURL = notification.profileImageURL {
                KFImage(URL(string: imageURL))
                    .resizeTo(width: 40, height: 40)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circlr.fill")
                    .resizeTo(width: 40, height: 40)
                    .clipShape(Circle())
            }
            Text("lisablackpink")
                .font(.system(size: 14, weight: .semibold))
            
            Text("has followed you.")
                .font(.system(size: 15))
            
            Text("2H")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            Spacer()
            
            Text("Follow")
                .font(.system(size: 14, weight: .semibold))
                .frame(width: 100, height: 32)
                .foregroundColor(.white)
                .background(Color.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding(.horizontal)
    }
}
