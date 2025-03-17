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
                Style.defaultBackground
                
                NavigationLink(isActive: $isActive) {
                    MessageListView(responderName: "Sarah Carter", messages: .default)
                } label: {
                    EmptyView()
                }
                
                Button(String(localized: "BUTTON_GO_TO_MESSAGE_LIST")) {
                    isActive.toggle()
                }
                .font(Style.Message.sentTextFont)
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
