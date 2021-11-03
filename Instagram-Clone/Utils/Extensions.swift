//
//  Extensions.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 21/10/2564 BE.
//

import SwiftUI
import UIKit
import Kingfisher

extension Image {
    func resizeTo(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipped()
    }
}

extension KFImage {
    func resizeTo(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipped()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
