//
//  DataFlow_State_Binding_ParentView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

struct DataFlow_State_Binding_ParentView: View {
    @State private var isFilled = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("State")
                Text("Binding")
            }
            
            Spacer()
            
            /// 这里使用了双向绑定，属性前面需要加上 $ 符号
            DataFlow_State_Binding_ChildView(isChecked: $isFilled)
            Text("点击上方的图像进行切换(直接在子视图上进行修改)")
            
            Spacer()
            
            Button {
                isFilled.toggle()
            } label: {
                Text("点击这里进行状态切换(父视图的修改，影响子视图)")
            }
            .padding(5)
            .overlay(
                RoundedRectangle(
                    cornerRadius: 5
                )
                .stroke(
                    Color.gray,
                    lineWidth: 1
                )
            )
            
            Spacer()
        }
        .navigationTitle("状态与数据流")
    }
}

struct DataFlow_State_Binding_ParentView_Previews: PreviewProvider {
    static var previews: some View {
        DataFlow_State_Binding_ParentView()
    }
}
