//
//  CenterHoleShape.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

/// 在 Shape 中心位置挖洞
struct CenterHoleShape: Shape, Animatable {
    var radius: CGFloat
    
    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
    }
    
    init(radius: CGFloat) {
        self.radius = radius
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let wh = 2 * radius
        let x = (width - wh) / 2.0
        let y = (height - wh) / 2.0
        
        var path = Rectangle().path(in: rect)
        if self.radius > 0.01 {
            let hole = Circle().path(in: CGRect(x: x, y: y, width: wh, height: wh)).reversed
            path.addPath(hole)
        }
        
        return path
    }
}

