//
//  ProfileHeader.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 1/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        if let imageURL = viewModel.user.profileImageURL {
                            KFImage(URL(string:  imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizeTo(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                        }
                    }
                    .sheet(isPresented: $imagePickerPresented) {
                        loadImage()
                    } content: {
                        ImagePicker(image: $selectedImage)
                }
            }
                
                HStack(spacing: 16) {
                    UserStatView(value: 210, title: "Posts")
                    UserStatView(value: 210, title: "Followers")
                    UserStatView(value: 210, title: "Followings")
                }
            }
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            HStack {
                Spacer()
                ProfileButtonView(viewModel: viewModel)
                Spacer()
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        viewModel.changeProfileImage(image: selectedImage)
    }
}

