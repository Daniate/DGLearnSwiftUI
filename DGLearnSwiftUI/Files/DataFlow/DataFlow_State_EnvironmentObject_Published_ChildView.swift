//
//  DataFlow_State_EnvironmentObject_Published_ChildView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct DataFlow_State_EnvironmentObject_Published_ChildView: View {
    /// 在创建该视图时，需要使用 .environmentObject，将数据传递进来
    @EnvironmentObject var item: DGItemEntity
    
    var body: some View {
        Image(systemName: item.isLiked ? "bookmark.fill" : "bookmark")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.green)
            .frame(width: 200, height: 200, alignment: .center)
            .onTapGesture {
                /// 模型中的 isLiked 属性，已被 Published 包装，因此，界面会随之发生变化
                self.item.isLiked.toggle()
            }
    }
}

struct DataFlow_State_EnvironmentObject_Published_ChildView_Previews: PreviewProvider {
    static var previews: some View {
        DataFlow_State_EnvironmentObject_Published_ChildView()
            .environmentObject(DGItemEntity(isLiked: false))
    }
}
