//
//  ContentView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    private let noTransaction = {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        return transaction
    }()
    
    var body: some View {
        NavigationView {
            NavigationLink(isActive: $isActive) {
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
            } label: {
                ZStack {
                    LinearGradient
                        .defaultBackground
                        .ignoresSafeArea()
                    
                    Button("Go to Message List") {
                        isActive.toggle()
                    }
                    .font(.interRegular(size: 15))
                    .foregroundStyle(.primaryWhite)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withTransaction(noTransaction) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
