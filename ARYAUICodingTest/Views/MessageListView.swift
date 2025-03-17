//
//  MessageListView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

struct MessageListView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var inputText = ""
    @State private var showSendButton = false
    @State private var isFullScreenCoverPresented = false
    @State private var plusButtonFrame: CGRect = .zero
    @FocusState private var inputTextFieldFocused: Bool
    
    let responderName: String
    let messages: [DisplayMessage]
    
    var body: some View {
        ZStack {
            Style.defaultBackground
            
            VStack {
                GeometryReader { proxy in
                    List(messages) { message in
                        let horizontalPadding = Style.Message.ListItem.paddingHorizontal
                        MessageView(width: proxy.size.width - horizontalPadding * 2, message: message)
                            .listRowSeparator(.hidden)
                            .listRowInsets(
                                EdgeInsets(
                                    top: Style.Message.ListItem.paddingTop,
                                    leading: horizontalPadding,
                                    bottom: Style.Message.ListItem.paddingBottom,
                                    trailing: horizontalPadding
                                )
                            )
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                }
                
                HStack(spacing: Style.Message.Input.plusButtonPaddingTrailing) {
                    plusButton
                    
                    HStack(spacing: Style.Message.Input.sendButtonPaddingLeading) {
                        inputTextField
                        
                        sendButton
                            .scaleEffect(showSendButton ? 1 : 0)
                            .opacity(showSendButton ? 1 : 0)
                            .animation(Style.Message.Input.sendButtonAnimation, value: showSendButton)
                    }
                    .padding(.vertical, Style.Message.Input.paddingVertical)
                    .padding(.trailing, Style.Message.Input.paddingTrailing)
                    .border(
                        edges: [.trailing, .bottom],
                        cornerRadius: Style.Message.Input.cornerRadius,
                        color: Style.Message.Input.lightBorderColor,
                        width: Style.Message.Input.borderWidth
                    )
                    .border(
                        edges: [.leading, .top],
                        cornerRadius: Style.Message.Input.cornerRadius,
                        color: Style.Message.Input.darkBorderColor,
                        width: Style.Message.Input.borderWidth
                    )
                    .background(
                        Style.Message.Input.backgroundColor,
                        in: .rect(cornerRadius: Style.Message.Input.cornerRadius)
                    )
                    .onChange(of: inputText) { showSendButton = !$0.isEmpty }
                }
                .padding(.bottom, Style.Message.Input.paddingBottom)
                .padding(.horizontal, Style.Message.Input.paddingHorizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack(spacing: Style.Message.NavBar.backButtonPaddingTrailing) {
                    backButton
                    responderView
                }
            }
        }
        .onTapGesture { inputTextFieldFocused = false }
        .customFullScreenCover(isPresented: $isFullScreenCoverPresented) {
            MessageAdditionOverlayView(plusButtonFrame: $plusButtonFrame) {
                isFullScreenCoverPresented = false
            }
        }
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Style.Message.NavBar.iconArrowPrevious
                .resizable()
                .scaledToFit()
                .frame(
                    width: Style.Message.NavBar.iconArrowPreviousSize,
                    height: Style.Message.NavBar.iconArrowPreviousSize
                )
        }
    }
    
    private var responderView: some View {
        HStack(spacing: Style.Message.NavBar.avatarResponderNameSpacing) {
            Style.Message.NavBar.avatar
                .resizable()
                .scaledToFit()
                .frame(width: Style.Message.NavBar.avatarSize, height: Style.Message.NavBar.avatarSize)
                .clipShape(.rect(cornerRadius: Style.Message.NavBar.avatarCornerRadius))
            
            Text(responderName)
                .font(Style.Message.NavBar.responderNameFont)
                .foregroundStyle(Style.Message.NavBar.responderNameColor)
        }
    }
    
    private var plusButton: some View {
        Button {
            isFullScreenCoverPresented = true
        } label: {
            Style.Message.Input.iconPlus
                .resizable()
                .background(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            plusButtonFrame = proxy.frame(in: .global)
                        }
                        return .clear
                    }
                )
                .frame(width: Style.Message.Input.plusIconSize, height: Style.Message.Input.plusIconSize)
        }
        .frame(width: Style.Message.Input.plusButtonSize, height: Style.Message.Input.plusButtonSize)
    }
    
    private var inputTextField: some View {
        TextField("", text: $inputText,
            prompt: Text("Message")
                .font(Style.Message.Input.placeholderFont)
                .foregroundColor(Style.Message.Input.placeholderColor)
        )
        .font(Style.Message.Input.inputTextFont)
        .foregroundStyle(Style.Message.Input.inputTextColor)
        .frame(height: Style.Message.Input.textFieldHeight)
        .padding(.leading, Style.Message.Input.textFieldPaddingLeading)
        .focused($inputTextFieldFocused)
    }
    
    private var sendButton: some View {
        Button {
            inputTextFieldFocused = false
        } label: {
            Color.primaryWhite
                .frame(width: Style.Message.Input.sendButtonSize, height: Style.Message.Input.sendButtonSize)
                .clipShape(.circle)
                .overlay {
                    Style.Message.Input.iconSend
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.sendMessageBrown)
                        .frame(width: Style.Message.Input.iconSendSize, height: Style.Message.Input.iconSendSize)
                }
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
