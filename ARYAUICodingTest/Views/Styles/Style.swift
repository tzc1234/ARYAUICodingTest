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
        static let bubbleWidthRatio: CGFloat = 0.72
        static let iconReadSize: CGFloat = 14
        static let textDateSpacing: CGFloat = 0
        static let dateIconReadSpacing: CGFloat = 4
        static let paddingTop: CGFloat = 8
        static let paddingBottom: CGFloat = 10
        static let paddingHorizontal: CGFloat = 10
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 14
        
        static var receivedTextFont: Font { .interRegular(size: 15) }
        static var sentTextFont: Font { .interMedium(size: 15) }
        static var dateFont: Font { .interRegular(size: 11) }
        
        static var sentTextColor: Color { .primaryBlack }
        static var receivedTextColor: Color { .primaryWhite }
        static var sentDateColor: Color { .primaryBlue }
        static var receivedDateColor: Color { .primaryWhite }
        static var receivedBackgroundColor: Color { .primaryBlack.opacity(0.15) }
        static var sentBackgroundColor: Color { .primaryWhite}
        static var darkBorderColor: Color { .primaryBlack.opacity(0.1) }
        static var lightBorderColor: Color { .primaryWhite.opacity(0.35) }
        
        static var iconRead: Image { .init("icon-chat-read") }
        
        enum NavBar {
            static let backButtonTrailingPadding: CGFloat = 16
            static let iconArrowPreviousSize: CGFloat = 15
            static let avatarSize: CGFloat = 32
            static let avatarCornerRadius: CGFloat = 10
            static let avatarResponderNameSpacing: CGFloat = 7
            
            static var responderNameFont: Font { .interSemiBold(size: 14) }
            
            static var responderNameColor: Color { .primaryWhite }
            
            static var iconArrowPrevious: Image { .init("icon-arrow-previous") }
            static var avatar: Image { .init("avatar-sarahcarter") }
        }
        
        enum ListItem {
            static let horizontalPadding: CGFloat = 12
            static let topPadding: CGFloat = 14
            static let bottomPadding: CGFloat = 0
        }
        
        enum Input {
            static let plusButtonTrailingPadding: CGFloat = 12
            static let plusIconSize: CGFloat = 14
            static let plusButtonSize: CGFloat = 28
            static let sendButtonLeadingPadding: CGFloat = 10
            static let cornerRadius: CGFloat = 30
            static let borderWidth: CGFloat = 1
            static let verticalPadding: CGFloat = 4
            static let trailingPadding: CGFloat = 4
            static let textFieldHeight: CGFloat = 30
            static let textFieldLeadingPadding: CGFloat = 10
            static let iconSendSize: CGFloat = 12
            static let sendButtonSize: CGFloat = 24
            static let bottomPadding: CGFloat = 6
            static let horizontalPadding: CGFloat = 12
            
            static var placeholderFont: Font { .interRegular(size: 15) }
            static var inputTextFont: Font { .interRegular(size: 15) }
            
            static var backgroundColor: Color { .primaryBlack.opacity(0.05) }
            static var darkBorderColor: Color { .primaryBlack.opacity(0.1) }
            static var lightBorderColor: Color { .primaryWhite.opacity(0.35) }
            static var placeholderColor: Color { .primaryWhite.opacity(0.7) }
            static var inputTextColor: Color { .primaryWhite }
            
            static var iconPlus: Image { .init("icon-plus") }
            static var iconSend: Image { .init("icon-sendmessage") }
            
            static var sendButtonAnimation: Animation { .cubicBezier(duration: 0.3) }
        }
    }
}
