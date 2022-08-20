//
//  SingleSelectionListView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

struct SingleSelectionListView: View {
    private var entities: [DGItemEntity]
    
    @State private var selection: DGItemEntity?
    
    init() {
        entities = []
        for i in 0..<50 {
            entities.append(DGItemEntity(content: "Item \(i)"))
        }
    }
    
    var body: some View {
        VStack {
            Text("点击右上角按钮可切换模式")
            /// selection：
            /// 如果是单选，需要遵循 Hashable 协议；
            /// 如果是多选，则需要使用 Set，Set 内的元素，需要遵循 Hashable 协议
            /// 这里使用了双向绑定，属性前面需要加上 $ 符号
            List(selection: $selection, content: {
                /// id，只需要遵循 Hashable 协议
                /// 如果要使用当前模型，则指定为 \.self
                /// 如果要使用当前模型的某个属性，比如 xxProp，则指定为 \.xxProp
                ForEach(entities, id: \.self) {
                    Text($0.content)
                }
            })
            .navigationTitle("单项选择")
            .toolbar {
                EditButton()
            }
            
            if let x = selection {
                Text("已选择：\(x.content)")
            } else {
                Text("未选择")
            }
        }
    }
}

struct DynamicSingleSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSelectionListView()
    }
}
