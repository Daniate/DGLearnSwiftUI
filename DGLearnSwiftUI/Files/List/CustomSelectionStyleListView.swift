//
//  CustomSelectionStyleListView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct CustomSelectionStyleListView: View {
    private var entities: [DGItemEntity]
    
    @State private var selections = Set<DGItemEntity>()
    
    init() {
        entities = []
        for i in 0..<50 {
            entities.append(DGItemEntity(content: "Item \(i)"))
        }
    }
    
    func listContent() -> some View {
        /// id，只需要遵循 Hashable 协议
        /// 如果要使用当前模型，则指定为 \.self
        /// 如果要使用当前模型的某个属性，比如 xxProp，则指定为 \.xxProp
        ForEach(entities, id: \.self) { entity in
            HStack {
                if self.selections.contains(entity) {
                    Text(entity.content)
                        .foregroundColor(Color.pink)
                        .font(.system(size: 24))
                        .bold()
                } else {
                    Text(entity.content)
                }
                Spacer()
                if self.selections.contains(entity) {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color.pink)
                }
            }
            .contentShape(Rectangle()) // 让 HStack 上的空白区域也可以点击
            .onTapGesture {
                if self.selections.contains(entity) {
                    self.selections.remove(entity)
                } else {
                    self.selections.insert(entity)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            /// selection：
            /// 如果是单选，需要遵循 Hashable 协议；
            /// 如果是多选，则需要使用 Set，Set 内的元素，需要遵循 Hashable 协议
            List(selection: $selections, content: {
                listContent()
            }).listStyle(GroupedListStyle())
            
            Text("点击进行选择，选择后再点击可取消选择")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("已选择 \(selections.count) 个")
        }
        .navigationBarTitle(Text("自定义选择样式"), displayMode: .large)
    }
}

struct CustomSelectionStyleListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSelectionStyleListView()
    }
}
