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
                MessageListView(responderName: "Sarah Carter", messages: .default)
            } label: {
                ZStack {
                    LinearGradient
                        .defaultBackground
                    
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
