//
//  DiggingCenterHoleEffect.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct DiggingCenterHoleEffect: Animatable, ViewModifier /* AnimatableModifier */ {
    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
    }
    
    var radius: CGFloat
    
    init(radius: CGFloat) {
        self.radius = radius
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CenterHoleShape(radius: self.radius))
    }
}
