//
//  DGButton.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/23.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

/// 用于解决 Button 空白区域无法点击的问题
struct DGButton<Label>: View where Label: View {
    
    private let action: () -> Void
    private let label: () -> Label
    
    init(action: @escaping () -> Void, label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: action) {
            label().contentShape(Rectangle()) /// 让空白区域也可以点击
        }.buttonStyle(PlainButtonStyle())
    }
}

struct DGButton_Previews: PreviewProvider {
    static var previews: some View {
        DGButton(action: {
            print("clicked hello")
        }, label: {
            Text("hello")
                .frame(width: 300, height: 40)
                .background(Color.black)
                .foregroundColor(Color(red: 0xef / 255.0, green: 0xa3 / 255.0, blue: 0xb7 / 255.0))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        })
    }
}
