//
//  FeedCell.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 21/10/2564 BE.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("lisa")
                    .resizeTo(width: 36, height: 36)
                    .clipShape(Circle())
                
                Text("lisablackpink")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            Image("lisa")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack {
                Image(systemName: "heart")
                    .resizeTo(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
                Image(systemName: "bubble.right")
                    .resizeTo(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
                Image(systemName: "paperplane")
                    .resizeTo(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            .padding(.leading, 4)
            
            Text("25 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 0.5)
            
            HStack {
                Text("lisablackpink")
                    .font(.system(size: 14, weight: .semibold))
                Text("I look great!!")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 8)
            
            Text("2H")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
