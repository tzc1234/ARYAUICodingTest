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
            static let backButtonPaddingTrailing: CGFloat = 16
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
            static let paddingHorizontal: CGFloat = 12
            static let paddingTop: CGFloat = 14
            static let paddingBottom: CGFloat = 0
        }
        
        enum Input {
            static let plusButtonPaddingTrailing: CGFloat = 12
            static let plusIconSize: CGFloat = 14
            static let plusButtonSize: CGFloat = 28
            static let sendButtonPaddingLeading: CGFloat = 10
            static let cornerRadius: CGFloat = 30
            static let borderWidth: CGFloat = 1
            static let paddingVertical: CGFloat = 4
            static let paddingTrailing: CGFloat = 4
            static let textFieldHeight: CGFloat = 30
            static let textFieldPaddingLeading: CGFloat = 10
            static let iconSendSize: CGFloat = 12
            static let sendButtonSize: CGFloat = 24
            static let paddingBottom: CGFloat = 6
            static let paddingHorizontal: CGFloat = 12
            
            static var placeholderFont: Font { .interRegular(size: 15) }
            static var inputTextFont: Font { .interRegular(size: 15) }
            
            static var backgroundColor: Color { .primaryBlack.opacity(0.05) }
            static var darkBorderColor: Color { .primaryBlack.opacity(0.1) }
            static var lightBorderColor: Color { .primaryWhite.opacity(0.35) }
            static var placeholderColor: Color { .primaryWhite.opacity(0.7) }
            static var inputTextColor: Color { .primaryWhite }
            static var iconSendColor: Color { Color(red: 201/255, green: 177/255, blue: 144/255) }
            
            static var iconPlus: Image { .init("icon-plus") }
            static var iconSend: Image { .init("icon-sendmessage") }
            
            static var sendButtonAnimation: Animation { .cubicBezier(duration: 0.2) }
        }
        
        enum Addition {
            static let animationDuration: CGFloat = 0.6
            static let vStackSpacing: CGFloat = 15
            static let paddingHorizontal: CGFloat = 20
            
            static var cameraFirstGradientColor: Color { .init(red: 189/255, green: 189/255, blue: 189/255) }
            static var cameraSecondGradientColor: Color { .init(red: 103/255, green: 103/255, blue: 103/255) }
            static var photosFirstGradientColor: Color { .init(red: 251/255, green: 218/255, blue: 137/255) }
            static var photosSecondGradientColor: Color { .init(red: 243/255, green: 130/255, blue: 132/255) }
            static var fileFirstGradientColor: Color { .init(red: 66/255, green: 227/255, blue: 151/255) }
            static var fileSecondGradientColor: Color { .init(red: 53/255, green: 171/255, blue: 174/255) }
            static var audioFirstGradientColor: Color { .init(red: 214/255, green: 167/255, blue: 227/255) }
            static var audioSecondGradientColor: Color { .init(red: 90/255, green: 129/255, blue: 232/255) }
            
            static var iconCamera: Image { .init("icon-camera") }
            static var iconPhotos: Image { .init("icon-photos") }
            static var iconFiles: Image { .init("icon-files") }
            static var iconAudio: Image { .init("icon-audio") }
            
            static var animation: Animation { .cubicBezier(duration: animationDuration) }
            
            enum Item {
                static let iconTitleSpacing: CGFloat = 15
                static let iconBackgroundSize: CGFloat = 36
                static let iconSize: CGFloat = 18
                
                static var titleFont: Font { .interRegular(size: 17) }
                
                static var titleColor: Color { .primaryWhite }
            }
        }
    }
}
