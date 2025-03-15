//
//  MessageListView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

struct MessageListView: View {
    let responderName: String
    let messages: [DisplayMessage]
    
    var body: some View {
        ZStack {
            LinearGradient
                .defaultBackground
            
            GeometryReader { proxy in
                List(messages) { message in
                    let horizontalPadding: CGFloat = 12
                    MessageView(width: proxy.size.width - horizontalPadding * 2, message: message)
                        .listRowSeparator(.hidden)
                        .listRowInsets(
                            EdgeInsets(top: 14, leading: horizontalPadding, bottom: 0, trailing: horizontalPadding)
                        )
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    backButton
                    responderView
                }
            }
        }
    }
    
    private var backButton: some View {
        Button {
            // No back action in this coding test.
        } label: {
            Image("icon-arrow-previous")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.primaryWhite)
                .scaledToFit()
                .frame(width: 15, height: 15)
        }
    }
    
    private var responderView: some View {
        HStack(spacing: 7) {
            Image("avatar-sarahcarter")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .clipShape(.rect(cornerRadius: 10))
            
            Text(responderName)
                .font(.interSemiBold(size: 14))
                .foregroundStyle(.primaryWhite)
        }
    }
}

#Preview {
    NavigationView {
        MessageListView(responderName: "Sarah Carter", messages: [
            DisplayMessage(
                text: "Hey John, let's get together and discuss the job proposal. Does Monday Work?",
                date: "11:48 AM",
                isMine: false,
                isRead: true
            ),
            DisplayMessage(
                text: "That would be great. Yes, I will see you on Monday.",
                date: "1:54 PM",
                isMine: true,
                isRead: true
            ),
        ])
    }
}
