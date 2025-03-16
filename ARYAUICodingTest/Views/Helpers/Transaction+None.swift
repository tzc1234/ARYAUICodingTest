//
//  Transaction+None.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 16/03/2025.
//

import SwiftUI

extension Transaction {
    static var none: Self {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        return transaction
    }
}
