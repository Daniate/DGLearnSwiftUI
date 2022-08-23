//
//  AnimationContentView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct AnimationContentView: View {
    private let COUNT = 10
    private let WIDTH_PER_ITEM = 20.0
    
    @State private var alignmentFlag: Bool = false
    @State private var showFlag: Bool = true
    @State private var values: [CGFloat]
    
    init() {
        var x: [CGFloat] = []
        for _ in 0..<COUNT {
            x.append(30 + CGFloat(arc4random_uniform(270)))
        }
        _values = State(initialValue: x)
    }
    
    func update() {
        alignmentFlag.toggle()
        values = generateValus();
    }
    
    func generateValus() -> [CGFloat] {
        var x: [CGFloat] = []
        if alignmentFlag {
            for _ in 0..<COUNT {
                x.append(30 + CGFloat(arc4random_uniform(70)))
            }
        } else {
            for _ in 0..<COUNT {
                x.append(30 + CGFloat(arc4random_uniform(270)))
            }
        }
        return x
    }
    
    func calculateSpacing(_ proxy: GeometryProxy) -> CGFloat {
        return (proxy.size.width - CGFloat((WIDTH_PER_ITEM * Double(COUNT)))) / CGFloat(COUNT + 1)
    }
    
    var body: some View {
        VStack {
            Text("点击矩形框可以执行动画")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(16)
        
            GeometryReader(content: { proxy in
                if self.showFlag {
                    /// 这里的 alignment，控制子视图之间的纵向对齐方式（找出高度最高的子视图，让该子视图在纵向上与 HStack 中间对齐，然后让其他子视图与该视图以 alignment 进行对齐，因此，子视图极有可能不会贴着 HStack 的边框）
                    HStack(alignment: self.alignmentFlag ? .bottom : .top, spacing: self.calculateSpacing(proxy)) {
                        ForEach(0..<self.values.count, id: \.self) { idx in
                            /// 先设置 transition，后设置 animation，否则在低版本上出现的效果会不符合预期
                            Capsule()
                                .fill(self.alignmentFlag ? Color.accentColor : .pink)
                                .frame(height: self.values[idx])
                                .transition(AnyTransition.slide)
                                .animation(.dg_ripple(at: idx))
                        }
                    }
                    /// 这里的 alignment，控制子视图与 HStack 的对齐方式（当不是 .center 时，子视图会贴着 HStack 的边框）
                    .frame(height: 300, alignment: self.alignmentFlag ? .bottom : .top)
                        .padding([.leading, .trailing], self.calculateSpacing(proxy))
                        .border(Color.green, width: 3.0)
                        .contentShape(Rectangle())
                        .transition(AnyTransition.slide.combined(with: AnyTransition.opacity))
                        .onTapGesture { self.update() }
                }
            })
            
            Spacer()
            
            Button("点击这里切换展示与隐藏") {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.showFlag.toggle()
                }
            }
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }.navigationBarTitle(Text("动画"), displayMode: .inline)
    }
}

struct AnimationContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationContentView()
    }
}
