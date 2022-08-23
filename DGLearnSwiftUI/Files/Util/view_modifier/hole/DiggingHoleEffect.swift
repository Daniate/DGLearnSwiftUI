//
//  DiggingHoleEffect.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct DiggingHoleEffect: Animatable, ViewModifier /* AnimatableModifier */ {
    
    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
    }
    
    var radius: CGFloat
    
    let center: CGPoint
    
    init(radius: CGFloat, center: CGPoint) {
        self.radius = radius
        self.center = center
    }

    func body(content: Content) -> some View {
        content
            .clipShape(HoleShape(radius: self.radius, center: self.center))
    }
}
