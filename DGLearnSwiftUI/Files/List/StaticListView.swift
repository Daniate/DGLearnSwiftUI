//
//  StaticListView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct StaticListView: View {
    var body: some View {
        /// 在一个容器中最多只能包含 10 个静态视图，这里使用 Group 对多个静态视图进行整合
        List {
            Group {
                Text("Item 00").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 01").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 02").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 03").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 04").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 05").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 06").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 07").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 08").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 09").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            }
            Group {
                Text("Item 10").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 11").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 12").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 13").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 14").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 15").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 16").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 17").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 18").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                Text("Item 19").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            }
        }
        .navigationBarTitle(Text("静态列表"), displayMode: .large)
        .listStyle(PlainListStyle())
    }
}

struct StaticListView_Previews: PreviewProvider {
    static var previews: some View {
        StaticListView()
    }
}
