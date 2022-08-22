//
//  Animation+DG.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

extension Animation {
    static func dg_ripple() -> Animation {
        Animation
            .spring(response: 0.55, dampingFraction: 0.525)
            .speed(2)
    }
    
    static func dg_ripple(at index: Int) -> Animation {
        dg_ripple()
            .delay(0.05 * Double(index))
    }
}
