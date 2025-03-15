//
//  EdgeBorder.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func border(edges: [Edge],
                cornerRadius: CGFloat,
                color: Color,
                width: CGFloat,
                isVisible: Bool = true) -> some View {
        if isVisible {
            overlay(EdgeBorder(edges: edges, cornerRadius: cornerRadius)
                .stroke(color, lineWidth: width))
        } else {
            self
        }
    }
}

struct EdgeBorder: Shape {
    let edges: [Edge]
    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        edges.map { edge in
            switch edge {
            case .top: topPath(width: rect.width)
            case .bottom: bottomPath(width: rect.width, height: rect.height)
            case .leading: leadingPath(height: rect.height)
            case .trailing: trailingPath(width: rect.width, height: rect.height)
            }
        }
        .reduce(into: Path()) { $0.addPath($1) }
    }
    
    private func topPath(width: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(225),
                endAngle: .degrees(270),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(-90),
                endAngle: .degrees(-45),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(-45),
                endAngle: .degrees(-90),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(270),
                endAngle: .degrees(225),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
    
    private func trailingPath(width: CGFloat, height: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(-45),
                endAngle: .degrees(0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(0),
                endAngle: .degrees(45),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(45),
                endAngle: .degrees(0),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(0),
                endAngle: .degrees(-45),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
    
    private func bottomPath(width: CGFloat, height: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(45),
                endAngle: .degrees(90),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: cornerRadius, y: height - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(90),
                endAngle: .degrees(135),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: cornerRadius, y: height - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(135),
                endAngle: .degrees(90),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(90),
                endAngle: .degrees(45),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
    
    private func leadingPath(height: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: cornerRadius, y: height - cornerRadius),
                radius: cornerRadius, startAngle: .degrees(135),
                endAngle: .degrees(180),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(180),
                endAngle: .degrees(225),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: cornerRadius, y: cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(225),
                endAngle: .degrees(180),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: cornerRadius, y: height - cornerRadius),
                radius: cornerRadius, startAngle: .degrees(180),
                endAngle: .degrees(135),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
}
