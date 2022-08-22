//
//  DataFlow_ObservedObject_Published_MasterView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct DataFlow_ObservedObject_Published_MasterView: View {
    /// DGItemEntity 遵循了 ObservableObject 协议，因此可以用 ObservedObject 进行包装
    @ObservedObject private var entity = DGItemEntity(isLiked: false)
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("ObservedObject")
                Text("Published")
            }
            
            Spacer()
            
            ZStack {
                Image(systemName: entity.isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.pink)
                
                Color(.sRGB, white: 0.0, opacity: 0.3)
            }
            .frame(width: 200, height: 200, alignment: .center)
            .border(Color.green, width: 3)
            
            Spacer()
            
            NavigationLink("点击这里进入详情页，修改后返回看看", destination: DataFlow_ObservedObject_Published_DetailView(entity: entity))
            
            Spacer()
        }.navigationBarTitle(Text("状态与数据流"), displayMode: .inline)
    }
}

struct DataFlow_ObservedObject_Published_MasterView_Previews: PreviewProvider {
    static var previews: some View {
        DataFlow_ObservedObject_Published_MasterView()
    }
}
