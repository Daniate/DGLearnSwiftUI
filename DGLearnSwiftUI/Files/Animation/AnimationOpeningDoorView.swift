//
//  AnimationOpeningDoorView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/22.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct AnimationOpeningDoorView: View {
    @State var doorClosed = true
    @State var bias = 0.5
    
    var body: some View {
        VStack {
            ZStack {
                Image("10003")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 500)
                    .zIndex(-1)// zIndex 设置一个较小的值，防止遮挡到动画效果
                
                if doorClosed {
                    Text("这是一个开门的动画效果")
                        .font(.system(size: 24))
                        .frame(width: 300, height: 500)
                        .background(Color.from(hexRGBA: 0x2579A8FF))
                        .foregroundColor(Color.from(hexRGB: 0xFFFFFF))
                        .transition(
                            AnyTransition.modifier(
                                active: OpeningDoorEffect(degrees: 90, horizontalBias: self.bias),
                                identity: OpeningDoorEffect(degrees: 0, horizontalBias: self.bias)
                            )
                    )
                }
            }
            .frame(width: 300, height: 500)
            .border(Color.gray, width: 3.0)
            .clipped()
            
            Spacer()
            
            Text("\(bias)")
            Slider(value: $bias, in: 0...1.0)
                .padding([.leading, .trailing], 24)
            
            Spacer()
            
            DGButton(action: {
                withAnimation(Animation.easeInOut(duration: 1.5)) {
                    self.doorClosed.toggle()
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

struct AnimationOpeningDoorView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOpeningDoorView()
    }
}
