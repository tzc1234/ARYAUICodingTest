//
//  ContentView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient
                    .defaultBackground
                
                NavigationLink(isActive: $isActive) {
                    MessageListView(responderName: "Sarah Carter", messages: .default)
                } label: {
                    EmptyView()
                }
                
                Button("Go to Message List") {
                    isActive.toggle()
                }
                .font(.interRegular(size: 16))
                .foregroundStyle(.primaryWhite)
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                withTransaction(.none) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
