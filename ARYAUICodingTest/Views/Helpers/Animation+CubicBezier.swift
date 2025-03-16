//
//  Animation+CubicBezier.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 16/03/2025.
//

import SwiftUI

extension Animation {
    static func cubicBezier(duration: TimeInterval) -> Self {
        Animation.timingCurve(0.15, 0.97, 0.47, 0.97, duration: duration)
    }
}
