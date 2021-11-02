//
//  UserCell.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 22/10/2564 BE.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("lisa")
                .resizeTo(width: 48, height: 48)
                .clipShape(Circle())
            VStack {
                Text("lisablackpink")
                    .font(.system(size: 14, weight: .semibold))
                Text("Lisa Blackpink")
                    .font(.system(size: 14))
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
