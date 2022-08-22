//
//  DataFlow_StateObject_ObservedObject_Published_ChildView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

struct DataFlow_StateObject_ObservedObject_Published_ChildView: View {
    /// DGItemEntity 遵循了 ObservableObject 协议，因此可以用 ObservedObject 进行包装
    @ObservedObject var entity: DGItemEntity
    
    var body: some View {
        Image(systemName: entity.isLiked ? "heart.fill" : "heart")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.pink)
            .frame(width: 200, height: 200, alignment: .center)
            .onTapGesture {
                /// 模型中的 isLiked 属性，已被 Published 包装，因此，界面会随之发生变化
                self.entity.isLiked.toggle()
            }
    }
}

struct StateDataFlowChildView_Previews: PreviewProvider {
    static var previews: some View {
        DataFlow_StateObject_ObservedObject_Published_ChildView(entity: DGItemEntity(isLiked: false))
    }
}
