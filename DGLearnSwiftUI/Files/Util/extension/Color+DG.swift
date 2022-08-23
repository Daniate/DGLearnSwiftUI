//
//  Color+DG.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

extension Color {
    /// 根据16进制数字创建颜色
    /// - Parameter hexRGB: 格式为 0xRRGGBB
    /// - Returns: 颜色
    static func from(hexRGB: Int) -> Color {
        Color(
            red: Double(hexRGB >> 16) / 0xFF,
            green: Double((hexRGB >> 8) & 0xFF) / 0xFF,
            blue: Double(hexRGB & 0xFF) / 0xFF
        )
    }
    
    /// 根据16进制数字创建颜色
    /// - Parameter hexRGBA: 格式为 0xRRGGBBAA
    /// - Returns: 颜色
    static func from(hexRGBA: Int) -> Color {
        Color(
            .sRGB,
            red: Double(hexRGBA >> 24) / 0xFF,
            green: Double((hexRGBA >> 16) & 0xFF) / 0xFF,
            blue: Double((hexRGBA >> 8) & 0xFF) / 0xFF,
            opacity: Double(hexRGBA & 0xFF) / 0xFF
        )
    }
}
