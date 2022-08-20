//
//  CustomSelectionListView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

struct CustomSelectionListView: View {
    private var entities: [DGItemEntity]
    
    @State private var selections = Set<DGItemEntity>()
    
    init() {
        entities = []
        for i in 0..<50 {
            entities.append(DGItemEntity(content: "Item \(i)"))
        }
    }
    
    var body: some View {
        VStack {
            Text("点击进行选择，选择后再点击可取消选择")
            /// selection：
            /// 如果是单选，需要遵循 Hashable 协议；
            /// 如果是多选，则需要使用 Set，Set 内的元素，需要遵循 Hashable 协议
            List(selection: $selections, content: {
                /// id，只需要遵循 Hashable 协议
                /// 如果要使用当前模型，则指定为 \.self
                /// 如果要使用当前模型的某个属性，比如 xxProp，则指定为 \.xxProp
                ForEach(entities, id: \.self) { entity in
                    HStack {
                        if selections.contains(entity) {
                            Text(entity.content)
                                .foregroundColor(Color.pink)
                                .font(.system(size: 24))
                                .bold()
                        } else {
                            Text(entity.content)
                        }
                        Spacer()
                        if selections.contains(entity) {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color.pink)
                        }
                    }
                    .contentShape(Rectangle()) // 让 HStack 上的空白区域也可以点击
                    .onTapGesture {
                        if selections.contains(entity) {
                            selections.remove(entity)
                        } else {
                            selections.insert(entity)
                        }
                    }
                }
            })
            .navigationTitle("自定义选择样式")
            
            Text("已选择 \(selections.count) 个")
        }
    }
}

struct CustomSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSelectionListView()
    }
}
