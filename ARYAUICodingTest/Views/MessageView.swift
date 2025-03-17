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
    private var isRead: Bool { message.isRead }
    private var bubbleWidth: CGFloat { width * Style.Message.bubbleWidthRatio }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: Style.Message.vStackSpacing) {
                Text(message.text)
                    .font(isMine ? Style.Message.sentFont : Style.Message.receivedFont)
                    .foregroundStyle(isMine ? Style.Message.sentColor : Style.Message.receivedColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: Style.Message.dateHStackSpacing) {
                    Text(message.date)
                        .font(Style.Message.dateFont)
                        .foregroundStyle(isMine ? Style.Message.sentDateColor : Style.Message.receivedDateColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    if isMine && isRead {
                        Style.Message.iconRead
                            .resizable()
                            .scaledToFit()
                            .frame(width: Style.Message.iconReadSize, height: Style.Message.iconReadSize)
                    }
                }
            }
            .padding(.top, Style.Message.paddingTop)
            .padding(.bottom, Style.Message.paddingBottom)
            .padding(.horizontal, Style.Message.paddingHorizontal)
            .border(
                edges: [.bottom, .trailing],
                cornerRadius: Style.Message.cornerRadius,
                color: Style.Message.lightBorderColor,
                width: Style.Message.borderWidth,
                isActive: !isMine
            )
            .border(
                edges: [.top, .leading],
                cornerRadius: Style.Message.cornerRadius,
                color: Style.Message.darkBorderColor,
                width: Style.Message.borderWidth,
                isActive: !isMine
            )
            .background(
                isMine ? Style.Message.sentBackgroundColor : Style.Message.receivedBackgroundColor,
                in: .rect(cornerRadius: Style.Message.cornerRadius)
            )
            .frame(width: bubbleWidth, alignment: isMine ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment: isMine ? .trailing : .leading)
    }
}

#Preview("Other message") {
    ZStack {
        Style.defaultBackground
        
        MessageView(
            width: 393,
            message: DisplayMessage(
                text: "Hey John, let's get together and discuss the job proposal. Does Monday Work?",
                date: "11:48 AM",
                isMine: false,
                isRead: true
            )
        )
    }
}

#Preview("My message") {
    ZStack {
        Style.defaultBackground
        
        MessageView(
            width: 393,
            message: DisplayMessage(
                text: "That would be great. Yes, I will see you on Monday.",
                date: "1:54 PM",
                isMine: true,
                isRead: true
            )
        )
    }
}
