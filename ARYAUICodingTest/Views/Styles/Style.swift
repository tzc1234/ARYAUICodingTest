//
//  Style.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 17/03/2025.
//

import SwiftUI

enum Style {
    static var defaultBackground: some View { LinearGradient.defaultBackground }
    
    enum Message {
        static let receivedFont = Font.interRegular(size: 15)
        static let sentFont = Font.interMedium(size: 15)
        static let dateFont = Font.interRegular(size: 11)
        
        static let sentColor = Color.primaryBlack
        static let receivedColor = Color.primaryWhite
        static let sentDateColor = Color.primaryBlue
        static let receivedDateColor = Color.primaryWhite
        static let receivedBackgroundColor = Color.primaryBlack.opacity(0.15)
        static let sentBackgroundColor = Color.primaryWhite
        static let darkBorderColor = Color.primaryBlack.opacity(0.1)
        static let lightBorderColor = Color.primaryWhite.opacity(0.35)
        
        static let bubbleWidthRatio: CGFloat = 0.72
        static let iconReadSize: CGFloat = 14
        static let vStackSpacing: CGFloat = 0
        static let dateHStackSpacing: CGFloat = 4
        static let paddingTop: CGFloat = 8
        static let paddingBottom: CGFloat = 10
        static let paddingHorizontal: CGFloat = 10
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 14
        
        static var iconRead: Image { .init("icon-chat-read") }
    }
}
