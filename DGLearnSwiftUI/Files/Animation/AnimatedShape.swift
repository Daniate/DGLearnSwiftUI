//
//  AnimatedShape.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/9/4.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct AnimatedShape: View {

    let duration: Double = 2.0
    
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                let time = context.date.timeIntervalSince1970
                // -180 ~ 180
                let rem = time.remainder(dividingBy: duration) * (360.0 / duration)
                // -1 ~ 1
                let x = sin(Angle(degrees: rem).radians)
                VStack {
//                    Text("\(x)")
                    Canvas { context, size in
                        /// Gradient
                        let gradientColor1 = Color(red: 1.000, green: 0.041, blue: 0.000)
                        let gradientColor2 = Color(red: 0.870, green: 1.000, blue: 0.016)
                        let gradient = Gradient(colors: [gradientColor1, gradientColor2])
                        let sp = CGPoint(x: 160.23, y: 73.76)
                        let ep = CGPoint(x: 160.23, y: 231.5)

                        /// Path: Star
                        var path = Path()
                        path.move(to: CGPoint(x: 168, y: 53.5))
                        path.addLine(to: CGPoint(x: 211.29+10*x, y: 113.96))
                        path.addLine(to: CGPoint(x: 284.74, y: 134.69-30*x))
                        path.addLine(to: CGPoint(x: 238.05-15+20*x, y: 192.79))
                        path.addLine(to: CGPoint(x: 240.15, y: 266.06))
                        path.addLine(to: CGPoint(x: 168+10*x, y: 241.5-15))
                        path.addLine(to: CGPoint(x: 95.85, y: 266.06))
                        path.addLine(to: CGPoint(x: 97.95+15+20*x, y: 192.79))
                        path.addLine(to: CGPoint(x: 51.26, y: 134.69+30*x))
                        path.addLine(to: CGPoint(x: 124.71+10*x, y: 113.96))
                        path.closeSubpath()
                        
                        /// Draw Shadow
                        context.addFilter(.shadow(color: .gray, radius: 5, x: 5, y: 5))
                        
                        context.fill(path, with: .linearGradient(gradient, startPoint: sp, endPoint: ep))
                        context.stroke(path, with: .color(.black), style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                    }
                    .frame(width: 320, height: 320)
                    .border(.green, width: 3)
                    
                    Canvas { context, size in
                        /// Gradient
                        let gradientColor1 = Color(red: 1.000, green: 0.041, blue: 0.000)
                        let gradientColor2 = Color(red: 0.870, green: 1.000, blue: 0.016)
                        let gradient = Gradient(colors: [gradientColor1, gradientColor2])
                        let sp = CGPoint(x: 160.23, y: 73.76)
                        let ep = CGPoint(x: 160.23, y: 231.5)

                        /// Path: Heart
                        var path = Path()
                        path.move(to: CGPoint(x: 164.5, y: 99.5))
                        path.addCurve(to: CGPoint(x: 209, y: 61+3*x), control1: CGPoint(x: 164.5, y: 99.5), control2: CGPoint(x: 174, y: 61))
                        path.addCurve(to: CGPoint(x: 248-3*x, y: 125), control1: CGPoint(x: 244, y: 61), control2: CGPoint(x: 260, y: 93))
                        path.addCurve(to: CGPoint(x: 165, y: 225), control1: CGPoint(x: 236, y: 157), control2: CGPoint(x: 165, y: 225))
                        path.addCurve(to: CGPoint(x: 79+3*x, y: 125), control1: CGPoint(x: 165, y: 225), control2: CGPoint(x: 91, y: 161))
                        path.addCurve(to: CGPoint(x: 122.5, y: 61.5+3*x), control1: CGPoint(x: 67, y: 89), control2: CGPoint(x: 90.5, y: 62.5))
                        path.addCurve(to: CGPoint(x: 164.5, y: 99.5), control1: CGPoint(x: 154.5, y: 60.5), control2: CGPoint(x: 164.5, y: 99.5))
                        path.closeSubpath()
                        
                        context.fill(path, with: .linearGradient(gradient, startPoint: sp, endPoint: ep))
                        context.stroke(path, with: .color(.black), style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round, dash: [2, 12]))
                    }
                    .frame(width: 320, height: 320)
                    .border(.green, width: 3)
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct AnimatedShape_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedShape()
    }
}
