//
//  ARYAUICodingTestApp.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

@main
struct ARYAUICodingTestApp: App {
    var body: some Scene {
        WindowGroup {
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
            .preferredColorScheme(.dark)
        }
    }
}
