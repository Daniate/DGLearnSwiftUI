//
//  AnimationDigRandomHolesView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct AnimationDigRandomHolesView: View {
    @State var dig = false
    
    let count = 10
    @State var centers: [CGPoint]
    
    init() {
        var x: [CGPoint] = []
        for _ in 0..<count {
            x.append(CGPoint(
                x: CGFloat.random(in: 10.0...290),
                y: CGFloat.random(in: 10.0...290)
            ))
        }
        _centers = State(initialValue: x)
    }
    
    func updateCenters() {
        var x: [CGPoint] = []
        for _ in 0..<count {
            x.append(CGPoint(
                x: CGFloat.random(in: 10.0...290),
                y: CGFloat.random(in: 10.0...290)
            ))
        }
        centers = x
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image("10002")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                /// fix bug on iOS 13: compositingGroup 用于处理 modifier 导致的文字消失问题
                Text("随机打一些圆孔")
                    .font(.system(size: 24))
                    .frame(width: 300, height: 300)
                    .background(Color.from(hexRGBA: 0x2579A8FF))
                    .foregroundColor(Color.from(hexRGB: 0xFFFFFF))
                    .compositingGroup()
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 10...80) : 0, center: centers[0]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 10...80) : 0, center: centers[1]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 10...80) : 0, center: centers[2]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 10...80) : 0, center: centers[3]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 10...80) : 0, center: centers[4]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 30...40) : 0, center: centers[5]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 30...40) : 0, center: centers[6]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 30...40) : 0, center: centers[7]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 30...40) : 0, center: centers[8]))
                    .modifier(DiggingHoleEffect(radius: dig ? CGFloat.random(in: 30...40) : 0, center: centers[9]))
            }
            
            Spacer()
            
            DGButton(action: {
                let duration = 0.5
                withAnimation(Animation.easeInOut(duration: duration)) {
                    self.dig.toggle()
                }
                
                if self.dig {
                    return
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    self.updateCenters()
                }
            }, label: {
                Text("Run")
                    .frame(width: 300, height: 40)
                    .background(Color.black)
                    .foregroundColor(Color.from(hexRGB: 0xEFA3B7))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
        }
    }
}

struct AnimationDigRandomHolesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDigRandomHolesView()
    }
}
