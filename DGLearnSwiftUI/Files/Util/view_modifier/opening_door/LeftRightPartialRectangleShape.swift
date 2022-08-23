//
//  LeftRightPartialRectangleShape.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

/// 对 Shape 分为左右两部分（矩形）
struct LeftRightPartialRectangleShape: Shape {
    enum LeftRightPartialRectangleShapePart {
        case left
        case right
    }
    
    let part: LeftRightPartialRectangleShapePart
    let horizontalBias: Double
    
    init(part: LeftRightPartialRectangleShapePart, horizontalBias: Double) {
        self.part = part
        self.horizontalBias = max(0.0, min(horizontalBias, 1.0))
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            var x: CGFloat
            var w: CGFloat
            
            switch (part) {
            case .left:
                x = 0.0
                w = CGFloat(horizontalBias) * width
                break
            case .right:
                x = CGFloat(horizontalBias) * width
                w = width - x
                break
            }
            path.addRect(CGRect(x: x, y: 0, width: w, height: height))
            path.closeSubpath()
        }
    }
}
