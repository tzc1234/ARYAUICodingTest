//
//  DisplayMessage.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import Foundation

struct DisplayMessage: Identifiable {
    let id = UUID()
    let text: String
    let date: String
    let isMine: Bool
    let isRead: Bool
}

extension [DisplayMessage] {
    static var `default`: Self {
        [
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
        ]
    }
}
