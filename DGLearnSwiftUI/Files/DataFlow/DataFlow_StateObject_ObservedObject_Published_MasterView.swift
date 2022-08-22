//
//  DataFlow_StateObject_ObservedObject_Published_MasterView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

#if swift(>=5.3)
@available(iOS 14.0, *)
struct DataFlow_StateObject_ObservedObject_Published_MasterView: View {
    @StateObject private var entity = DGItemEntity(isLiked: false)
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("StateObject")
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
            
            NavigationLink("点击这里进入详情页，修改后返回看看", destination: DataFlow_StateObject_ObservedObject_Published_DetailView(entity: entity))
            
            Spacer()
        }
        .dg_navigationTitle("状态与数据流")
    }
}

@available(iOS 14.0, *)
struct DataFlow_StateObject_ObservedObject_Published_MasterView_Previews: PreviewProvider {
    static var previews: some View {
        return DataFlow_StateObject_ObservedObject_Published_MasterView()
    }
}

#endif
