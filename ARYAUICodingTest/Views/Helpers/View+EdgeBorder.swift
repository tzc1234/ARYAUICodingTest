//
//  View+EdgeBorder.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import SwiftUI


extension View {
    @ViewBuilder
    func border(edges: [Edge], radius: CGFloat, color: Color, width: CGFloat, isVisible: Bool = true) -> some View {
        if isVisible {
            overlay(EdgeBorder(edges: edges, radius: radius)
                .stroke(color, lineWidth: width))
        } else {
            self
        }
    }
}

struct EdgeBorder: Shape {
    let edges: [Edge]
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let maxRadius = min(rect.width, rect.height) / 2
        let adjustedRadius = radius > maxRadius ? maxRadius : radius
        
        return edges.map { edge in
            switch edge {
            case .top: topPath(width: rect.width, radius: adjustedRadius)
            case .bottom: bottomPath(width: rect.width, height: rect.height, radius: adjustedRadius)
            case .leading: leadingPath(height: rect.height, radius: adjustedRadius)
            case .trailing: trailingPath(width: rect.width, height: rect.height, radius: adjustedRadius)
            }
        }
        .reduce(into: Path()) { $0.addPath($1) }
    }
    
    private func topPath(width: CGFloat, radius: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: radius, y: radius),
                radius: radius,
                startAngle: .degrees(225),
                endAngle: .degrees(270),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - radius, y: radius),
                radius: radius,
                startAngle: .degrees(-90),
                endAngle: .degrees(-45),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - radius, y: radius),
                radius: radius,
                startAngle: .degrees(-45),
                endAngle: .degrees(-90),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: radius, y: radius),
                radius: radius,
                startAngle: .degrees(270),
                endAngle: .degrees(225),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
    
    private func trailingPath(width: CGFloat, height: CGFloat, radius: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: width - radius, y: radius),
                radius: radius,
                startAngle: .degrees(-45),
                endAngle: .degrees(0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - radius, y: height - radius),
                radius: radius,
                startAngle: .degrees(0),
                endAngle: .degrees(45),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: width - radius, y: height - radius),
                radius: radius,
                startAngle: .degrees(45),
                endAngle: .degrees(0),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: width - radius, y: radius),
                radius: radius,
                startAngle: .degrees(0),
                endAngle: .degrees(-45),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
    
    private func bottomPath(width: CGFloat, height: CGFloat, radius: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: width - radius, y: height - radius),
                radius: radius,
                startAngle: .degrees(45),
                endAngle: .degrees(90),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: radius, y: height - radius),
                radius: radius,
                startAngle: .degrees(90),
                endAngle: .degrees(135),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: radius, y: height - radius),
                radius: radius,
                startAngle: .degrees(135),
                endAngle: .degrees(90),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: width - radius, y: height - radius),
                radius: radius,
                startAngle: .degrees(90),
                endAngle: .degrees(45),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
    
    private func leadingPath(height: CGFloat, radius: CGFloat) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: radius, y: height - radius),
                radius: radius, startAngle: .degrees(135),
                endAngle: .degrees(180),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: radius, y: radius),
                radius: radius,
                startAngle: .degrees(180),
                endAngle: .degrees(225),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: radius, y: radius),
                radius: radius,
                startAngle: .degrees(225),
                endAngle: .degrees(180),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: radius, y: height - radius),
                radius: radius, startAngle: .degrees(180),
                endAngle: .degrees(135),
                clockwise: true
            )
            path.closeSubpath()
        }
    }
}
