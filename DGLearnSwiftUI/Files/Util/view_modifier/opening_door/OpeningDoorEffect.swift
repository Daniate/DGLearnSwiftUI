//
//  OpeningDoorEffect.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct OpeningDoorEffect: ViewModifier {
    let degrees: Double
    let horizontalBias: Double
    
    init(degrees: Double, horizontalBias: Double) {
        self.degrees = degrees
        self.horizontalBias = max(0.0, min(horizontalBias, 1.0))
    }
    
    static func identity(of effect: OpeningDoorEffect) -> OpeningDoorEffect {
        OpeningDoorEffect(degrees: 0.0, horizontalBias: effect.horizontalBias)
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .clipShape(LeftRightPartialRectangleShape(part: .left, horizontalBias: horizontalBias))
                .rotation3DEffect(Angle.degrees(degrees), axis: (0.0, 1.0, 0.0), anchor: .leading)
            content
                .clipShape(LeftRightPartialRectangleShape(part: .right, horizontalBias: horizontalBias))
                .rotation3DEffect(Angle.degrees(-degrees), axis: (0.0, 1.0, 0.0), anchor: .trailing)
        }
    }
}
