//
//  NotificationCell.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 22/10/2564 BE.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image("lisa")
                .resizeTo(width: 40, height: 40)
                .clipShape(Circle())
            
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

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
