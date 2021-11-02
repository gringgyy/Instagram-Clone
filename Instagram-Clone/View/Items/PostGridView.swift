//
//  PostGridView.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 22/10/2564 BE.
//

import SwiftUI

struct PostGridView: View {
    let items = [GridItem(), GridItem(), GridItem()]
    let width = UIScreen.main.bounds.width / 3
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<10) { _ in
                Image("lisa")
                    .resizeTo(width: width, height: width)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
