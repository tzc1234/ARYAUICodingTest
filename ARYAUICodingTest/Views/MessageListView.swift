//
//  MessageListView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

struct MessageListView: View {
    let messages: [DisplayMessage]
    
    var body: some View {
        ZStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 4 / 255, green: 141 / 255, blue: 245 / 255), location: 0.0),
                    Gradient.Stop(color: Color(red: 20 / 255, green: 168 / 255, blue: 246 / 255), location: 0.3),
                    Gradient.Stop(color: Color(red: 145 / 255, green: 174 / 255, blue: 187 / 255), location: 0.6),
                    Gradient.Stop(color: Color(red: 233 / 255, green: 195 / 255, blue: 156 / 255), location: 0.85)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            GeometryReader { proxy in
                List(messages) { message in
                    MessageView(width: proxy.size.width, message: message)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 14, leading: 12, bottom: 0, trailing: 12))
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    MessageListView(messages: [
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
