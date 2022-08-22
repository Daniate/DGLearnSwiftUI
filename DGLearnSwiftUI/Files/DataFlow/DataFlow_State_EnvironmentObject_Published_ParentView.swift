//
//  DataFlow_State_EnvironmentObject_Published_ParentView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct DataFlow_State_EnvironmentObject_Published_ParentView: View {
    @State var entity = DGItemEntity(isLiked: false)
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("State")
                Text("EnvironmentObject")
                Text("Published")
            }
            
            Spacer()
            
            /// 使用 .environmentObject，将数据传递给子视图，
            /// 所传递的数据必须遵循 ObservableObject 协议
            DataFlow_State_EnvironmentObject_Published_ChildView()
                .environmentObject(entity)
            
            Text("点击上方的图像进行切换(直接在子视图上进行修改)")
            
            Spacer()
            
            Button("点击这里进行状态切换(父视图的修改，影响子视图)") {
                self.entity.isLiked.toggle()
            }
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            Spacer()
        }.navigationBarTitle(Text("状态与数据流"), displayMode: .inline)
    }
}

struct DataFlow_State_EnvironmentObject_Published_ParentView_Previews: PreviewProvider {
    static var previews: some View {
        DataFlow_State_EnvironmentObject_Published_ParentView()
    }
}
