//
//  AnimationDigCenterHoleView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct AnimationDigCenterHoleView: View {
    @State var dig = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("10001")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                /// fix bug on iOS 13: compositingGroup 用于处理 modifier 导致的文字消失问题
                Text("打个圆孔")
                    .font(.system(size: 24))
                    .frame(width: 300, height: 300)
                    .background(Color.from(hexRGBA: 0x2579A8FF))
                    .foregroundColor(Color.from(hexRGB: 0xFFFFFF))
                    .compositingGroup()
                    .modifier(DiggingCenterHoleEffect(radius: dig ? CGFloat(100 + arc4random_uniform(51)) : 0))
            }
            
            Spacer()
            
            DGButton(action: {
                let duration = 0.5
                withAnimation(Animation.easeInOut(duration: duration)) {
                    self.dig.toggle()
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

struct AnimationDigHoleView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDigCenterHoleView()
    }
}
