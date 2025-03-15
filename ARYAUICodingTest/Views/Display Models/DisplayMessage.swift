//
//  DisplayMessage.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 15/03/2025.
//

import Foundation

struct DisplayMessage: Identifiable {
    let id = UUID()
    let text: String
    let date: String
    let isMine: Bool
}
