//
//  HoleShape.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

/// 在 Shape 上随机挖洞
struct HoleShape: Shape {
    var radius: CGFloat
    
    let center: CGPoint
    
    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
    }
    
    init(radius: CGFloat, center: CGPoint) {
        self.radius = radius
        self.center = center
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        if self.radius > 0.01 {
            let wh = 2 * radius
            let x = center.x - radius
            let y = center.y - radius
            
            let hole = Circle().path(in: CGRect(x: x, y: y, width: wh, height: wh)).reversed
            path.addPath(hole)
        }
        
        return path
    }
}
