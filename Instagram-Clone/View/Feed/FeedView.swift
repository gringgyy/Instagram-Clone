//
//  FeedView.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 21/10/2564 BE.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { _ in
                    FeedCell()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
