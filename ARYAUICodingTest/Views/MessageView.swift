//
//  MessageView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

struct MessageView: View {
    let width: CGFloat
    let message: DisplayMessage
    
    private var isMine: Bool { message.isMine }
    private var contentWidth: CGFloat { width * 0.7 }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(message.text)
                    .font(isMine ? .interMedium(size: 14) : .interRegular(size: 14))
                    .foregroundStyle(isMine ? .primaryBlack : .primaryWhite)
                
                HStack(spacing: 4) {
                    Text(message.date)
                        .font(.interRegular(size: 10))
                        .foregroundStyle(isMine ? .primaryBlue : .primaryWhite)
                        .frame(width: contentWidth, alignment: .trailing)
                    
                    if isMine {
                        Image("icon-chat-read")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                    }
                }
            }
            .padding(.top, 8)
            .padding([.bottom, .horizontal], 10)
            .border(edges: [.bottom, .trailing], cornerRadius: 14, color: .primaryWhite.opacity(0.35),
                    isVisible: !isMine)
            .border(edges: [.top, .leading], cornerRadius: 14, color: .primaryBlack.opacity(0.1), isVisible: !isMine)
            .background(isMine ? .primaryWhite : .primaryBlack.opacity(0.15), in: .rect(cornerRadius: 14))
            .frame(width: contentWidth, alignment: isMine ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: isMine ? .trailing : .leading)
    }
}

#Preview("Other message") {
    ZStack {
        MessageView(
            width: 393,
            message: DisplayMessage(
                text: "Hey John, let's get together and discuss the job proposal. Does Monday Work?",
                date: "11:48 AM",
                isMine: false
            )
        )
        .padding(1)
    }
    .frame(height: 300)
    .background(Color.orange)
}

#Preview("My message") {
    ZStack {
        MessageView(
            width: 393,
            message: DisplayMessage(
                text: "That would be great. Yes, I will see you on Monday.",
                date: "1:54 PM",
                isMine: true
            )
        )
        .padding(1)
    }
    .frame(height: 300)
    .background(Color.orange)
}
