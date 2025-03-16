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
                    // Only from iOS 17 we get the completion version of withAnimation.
                    withAnimation(.cubicBezier(duration: 0.6)) {
                        isAnimating = false
                    }
                    
                    // So here using the good old asyncAfter trick.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        backgroundTapped()
                    }
                }
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    MessageAdditionItemButton(
                        title: "Camera",
                        iconName: "icon-camera",
                        firstGradientColor: Color(red: 189/255, green: 189/255, blue: 189/255),
                        secondGradientColor: Color(red: 103/255, green: 103/255, blue: 103/255),
                        buttonTapped: {}
                    )
                    
                    MessageAdditionItemButton(
                        title: "Photos",
                        iconName: "icon-photos",
                        firstGradientColor: Color(red: 251/255, green: 218/255, blue: 137/255),
                        secondGradientColor: Color(red: 243/255, green: 130/255, blue: 132/255),
                        buttonTapped: {}
                    )
                    
                    MessageAdditionItemButton(
                        title: "Files",
                        iconName: "icon-files",
                        firstGradientColor: Color(red: 66/255, green: 227/255, blue: 151/255),
                        secondGradientColor: Color(red: 53/255, green: 171/255, blue: 174/255),
                        buttonTapped: {}
                    )
                    
                    MessageAdditionItemButton(
                        title: "Audio",
                        iconName: "icon-audio",
                        firstGradientColor: Color(red: 214/255, green: 167/255, blue: 227/255),
                        secondGradientColor: Color(red: 90/255, green: 129/255, blue: 232/255),
                        buttonTapped: {}
                    )
                }
                .padding(.horizontal, 20)
                // Ensure the message addition overlay items just above the plus button.
                .padding(.bottom, screenSize.height - plusButtonFrame.minY)
                .scaleEffect(
                    isAnimating ? 1 : 0.2,
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
            
            // Wait the view ready, then animating.
            DispatchQueue.main.async {
                withAnimation(.cubicBezier(duration: 0.6)) {
                    isAnimating = true
                }
            }
        }
    }
}

struct MessageAdditionItemButton: View {
    let title: String
    let iconName: String
    let firstGradientColor: Color
    let secondGradientColor: Color
    let buttonTapped: () -> Void
    
    var body: some View {
        Button {
            buttonTapped()
        } label: {
            HStack(spacing: 15) {
                LinearGradient.messageAdditionButtonBackground(
                    firstColor: firstGradientColor,
                    secondColor: secondGradientColor
                )
                .frame(width: 36, height: 36)
                .clipShape(.circle)
                .overlay {
                    Image(iconName)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
                
                Text(title)
                    .font(.interRegular(size: 17))
                    .foregroundStyle(.primaryWhite)
            }
        }
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    MessageAdditionOverlayView(plusButtonFrame: .constant(.init(x: 19, y: 792, width: 14, height: 14))) {}
        .background(.red)
}
