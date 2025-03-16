//
//  LinearGradient+DefaultBackground.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

extension LinearGradient {
    static var defaultBackground: some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 4/255, green: 141/255, blue: 245/255), location: 0.0),
                Gradient.Stop(color: Color(red: 20/255, green: 168/255, blue: 246/255), location: 0.3),
                Gradient.Stop(color: Color(red: 145/255, green: 174/255, blue: 187/255), location: 0.6),
                Gradient.Stop(color: Color(red: 233/255, green: 195/255, blue: 156/255), location: 0.85)
            ],
            startPoint: .topLeading,
            endPoint: UnitPoint(x: 1.6, y: 0.6)
        )
        .ignoresSafeArea()
    }
    
    static func messageAdditionButtonBackground(firstColor: Color, secondColor: Color) -> some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: firstColor, location: 0.0),
                Gradient.Stop(color: secondColor, location: 1.0)
            ],
            startPoint: .topLeading,
            endPoint: UnitPoint(x: 1.6, y: 0.6)
        )
    }
}
