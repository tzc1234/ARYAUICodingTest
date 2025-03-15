//
//  SwiftUI+Fonts.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

extension Font {
    static func interMedium(size: CGFloat) -> Self {
        custom("Inter-Medium", size: size)
    }
    
    static func interSemiBold(size: CGFloat) -> Self {
        custom("Inter-SemiBold", size: size)
    }
    
    static func interRegular(size: CGFloat) -> Self {
        custom("Inter-Regular", size: size).weight(.medium)
    }
}
