//
//  NotificationView.swift
//  Instagram-Clone
//
//  Created by Kulnis Chattratitiphan on 21/10/2564 BE.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.notification) { notification in
                    NotificationCell(viewModel: NotificationsCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}
