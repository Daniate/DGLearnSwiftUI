//
//  SmoothCurve.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/28.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct SmoothCurve: View {
    
    @State private var pointsCount: Double = 10;
    
    let xSmoothFactor: CGFloat = 0.5
    let ySmoothFactor: CGFloat = 0.5
    
    /// 斜率
    func slope(from: CGPoint, to:CGPoint) -> CGFloat {
        if to.x == from.x {
            return 0.0;
        }
        return (to.y - from.y) / (to.x - from.x);
    }
    
    func buildSmoothCurveView(_ proxy: GeometryProxy, pointsCount: Int) -> some View {
        var points: [CGPoint] = []
        let padding = 10.0
        let xStep = (proxy.size.width - 2 * padding) / CGFloat(pointsCount - 1)
        
        /// 随机生成点，并连接为光滑曲线
        let pathForCurveLine = Path { p in
            // 随机生成坐标点
            var x = padding
            for _ in 0..<pointsCount {
                let y = arc4random_uniform(150)
                points.append(CGPoint(x: x, y: Double(y)))
                x += xStep
            }
            
            var dx1: CGFloat = 0.0
            var dy1: CGFloat = 0.0
            
            var prevPoint = points[0]
            
            // 移动到第一个点
            p.move(to: prevPoint)
            
            for i in 1..<points.count {
                let currPoint = points[i]
                
                var dx2: CGFloat = 0.0
                var dy2: CGFloat = 0.0
                
                if i + 1 < points.count {
                    let nextPoint = points[i + 1]
                    dx2 = -xSmoothFactor * (nextPoint.x - currPoint.x)
                    dy2 = dx2 * ySmoothFactor * slope(from: prevPoint, to: nextPoint)
                } else {
                    dx2 = 0.0
                    dy2 = 0.0
                }
                // 追加曲线
                p.addCurve(
                    to: currPoint,
                    control1: CGPoint(x: prevPoint.x - dx1, y: prevPoint.y - dy1),
                    control2: CGPoint(x: currPoint.x + dx2, y: currPoint.y + dy2)
                )
                
                prevPoint = currPoint;
                
                dx1 = dx2;
                dy1 = dy2;
            }
        }
        let curveLineView = pathForCurveLine.stroke(
            Color.green,
            lineWidth: 2.0
        )
        
        /// 画出所有的点
        let pathForPoints = Path { p in
            let cornerRadius = 3.0
            for i in 0..<points.count {
                p.move(to: points[i])
                
                let rect = CGRect(
                    x: points[i].x - cornerRadius,
                    y: points[i].y - cornerRadius,
                    width: cornerRadius * 2.0,
                    height: cornerRadius * 2.0
                )
                let size = CGSize(
                    width: cornerRadius,
                    height: cornerRadius
                )
                p.addRoundedRect(
                    in: rect,
                    cornerSize: size
                )
            }
        }
        let pointsView = pathForPoints.fill(Color.red)
        
        return curveLineView
            .dg_overlay(content: pointsView)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                buildSmoothCurveView(proxy, pointsCount: Int(pointsCount))
                    .border(Color.black, width: 1)
                Slider(value: $pointsCount, in: 10...50, label: {
                    Text("点的个数");
                }).padding([.leading, .trailing], 24)
            }
        }
    }
}

struct SmoothCurve_Previews: PreviewProvider {
    static var previews: some View {
        SmoothCurve()
    }
}
