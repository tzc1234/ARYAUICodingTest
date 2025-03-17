//
//  MessageAdditionOverlayView.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 16/03/2025.
//

import SwiftUI

struct MessageAdditionOverlayView: View {
    @State private var screenSize: CGSize = .zero
    @State private var isAnimating = false
    
    @Binding var plusButtonFrame: CGRect
    let backgroundTapped: () -> Void
    
    var body: some View {
        ZStack {
            BackgroundBlurView(style: .systemUltraThinMaterial)
                .ignoresSafeArea()
                .onTapGesture {
                    // Only from iOS 17 we get the withAnimation with completion.
                    withAnimation(Style.Message.Addition.animation) {
                        isAnimating = false
                    }
                    
                    // So here using the good old asyncAfter trick.
                    DispatchQueue.main.asyncAfter(deadline: .now() + Style.Message.Addition.animationDuration + 0.1) {
                        backgroundTapped()
                    }
                }
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: Style.Message.Addition.vStackSpacing) {
                    MessageAdditionItemButton(
                        title: String(localized: "MESSAGE_ADDITION_ITEM_CAMERA"),
                        icon: Style.Message.Addition.iconCamera,
                        firstGradientColor: Style.Message.Addition.cameraFirstGradientColor,
                        secondGradientColor: Style.Message.Addition.cameraSecondGradientColor,
                        buttonTapped: {}
                    )
                    
                    MessageAdditionItemButton(
                        title: String(localized: "MESSAGE_ADDITION_ITEM_PHOTOS"),
                        icon: Style.Message.Addition.iconPhotos,
                        firstGradientColor: Style.Message.Addition.photosFirstGradientColor,
                        secondGradientColor: Style.Message.Addition.photosSecondGradientColor,
                        buttonTapped: {}
                    )
                    
                    MessageAdditionItemButton(
                        title: String(localized: "MESSAGE_ADDITION_ITEM_FILES"),
                        icon: Style.Message.Addition.iconFiles,
                        firstGradientColor: Style.Message.Addition.fileFirstGradientColor,
                        secondGradientColor: Style.Message.Addition.fileSecondGradientColor,
                        buttonTapped: {}
                    )
                    
                    MessageAdditionItemButton(
                        title: String(localized: "MESSAGE_ADDITION_ITEM_AUDIO"),
                        icon: Style.Message.Addition.iconAudio,
                        firstGradientColor: Style.Message.Addition.audioFirstGradientColor,
                        secondGradientColor: Style.Message.Addition.audioSecondGradientColor,
                        buttonTapped: {}
                    )
                }
                .padding(.horizontal, Style.Message.Addition.paddingHorizontal)
                // Ensure the message addition overlay items just above the plus button.
                .padding(.bottom, screenSize.height - plusButtonFrame.minY)
                .scaleEffect(isAnimating ? 1 : 0.2,
                    // Scale begin/end at plus button max X and Y.
                    anchor: UnitPoint(
                        x: plusButtonFrame.maxX / screenSize.width,
                        y: plusButtonFrame.maxY / screenSize.height
                    )
                )
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .opacity(isAnimating ? 1 : 0)
        .onAppear {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                screenSize = windowScene.screen.bounds.size
            }
            
            withAnimation(Style.Message.Addition.animation) { isAnimating = true }
        }
    }
}

struct MessageAdditionItemButton: View {
    let title: String
    let icon: Image
    let firstGradientColor: Color
    let secondGradientColor: Color
    let buttonTapped: () -> Void
    
    var body: some View {
        Button {
            buttonTapped()
        } label: {
            HStack(spacing: Style.Message.Addition.Item.iconTitleSpacing) {
                LinearGradient.messageAdditionButtonBackground(
                    firstColor: firstGradientColor,
                    secondColor: secondGradientColor
                )
                .frame(
                    width: Style.Message.Addition.Item.iconBackgroundSize,
                    height: Style.Message.Addition.Item.iconBackgroundSize
                )
                .clipShape(.circle)
                .overlay {
                    icon
                        .resizable()
                        .frame(
                            width: Style.Message.Addition.Item.iconSize,
                            height: Style.Message.Addition.Item.iconSize
                        )
                }
                
                Text(title)
                    .font(Style.Message.Addition.Item.titleFont)
                    .foregroundStyle(Style.Message.Addition.Item.titleColor)
            }
        }
    }
}

#Preview {
    MessageAdditionOverlayView(plusButtonFrame: .constant(.init(x: 19, y: 792, width: 14, height: 14))) {}
        .background(LinearGradient.defaultBackground)
}
