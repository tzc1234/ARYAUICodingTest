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
            LinearGradient
                .defaultBackground
            
            VStack {
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
                
                HStack(spacing: 12) {
                    plusButton
                    
                    HStack(spacing: 10) {
                        inputTextField
                        
                        sendMessageButton
                            .scaleEffect(showSendButton ? 1 : 0)
                            .opacity(showSendButton ? 1 : 0)
                            .animation(.cubicBezier(duration: 0.3), value: showSendButton)
                    }
                    .padding([.top, .trailing, .bottom], 4)
                    .border(edges: [.trailing, .bottom], radius: 30, color: .primaryWhite.opacity(0.35), width: 1)
                    .border(edges: [.leading, .top], radius: 30, color: .primaryBlack.opacity(0.1), width: 1)
                    .background(.primaryBlack.opacity(0.05), in: .rect(cornerRadius: 30))
                    .onChange(of: inputText) { showSendButton = !$0.isEmpty }
                }
                .padding(.horizontal, 12)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack(spacing: 16) {
                    backButton
                    responderView
                }
            }
        }
        .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
            MessageAdditionOverlayView(plusButtonFrame: $plusButtonFrame) {
                withTransaction(.none) { isFullScreenCoverPresented = false }
            }
        }
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image("icon-arrow-previous")
                .resizable()
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
    
    private var plusButton: some View {
        Button {
            withTransaction(.none) { isFullScreenCoverPresented = true }
        } label: {
            Image("icon-plus")
                .resizable()
                .background(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            plusButtonFrame = proxy.frame(in: .global)
                        }
                        return .clear
                    }
                )
                .frame(width: 14, height: 14)
        }
        .frame(width: 28)
    }
    
    private var inputTextField: some View {
        TextField("", text: $inputText, prompt: Text("Message").foregroundColor(.primaryWhite.opacity(0.7)))
            .foregroundStyle(.primaryWhite)
            .font(.interRegular(size: 15))
            .frame(height: 30)
            .padding(.leading, 10)
            .focused($inputTextFieldFocused)
    }
    
    private var sendMessageButton: some View {
        Button {
            inputTextFieldFocused = false
        } label: {
            Color.primaryWhite
                .frame(width: 24, height: 24)
                .clipShape(.circle)
                .overlay {
                    Image("icon-sendmessage")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.sendMessageBrown)
                        .frame(width: 12, height: 12)
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
