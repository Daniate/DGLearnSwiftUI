//
//  ContentView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var links: [NavigationLink<Text, AnyView>] = [
        NavigationLink("列表-静态", destination: AnyView(StaticListView())),
        NavigationLink("列表-单选", destination: AnyView(SingleSelectionListView())),
        NavigationLink("列表-多选", destination: AnyView(MultipleSelectionListView())),
        NavigationLink("列表-自定义选择样式", destination: AnyView(CustomSelectionStyleListView())),
        NavigationLink("数据流-State-Binding", destination: AnyView(DataFlow_State_Binding_ParentView())),
        NavigationLink("数据流-State-EnvironmentObject-Published", destination: AnyView(DataFlow_State_EnvironmentObject_Published_ParentView())),
        NavigationLink("数据流-State-ObservedObject-Published", destination: AnyView(DataFlow_State_ObservedObject_Published_ParentView())),
        NavigationLink("数据流-ObservedObject-Published", destination: AnyView(DataFlow_ObservedObject_Published_MasterView())),
        NavigationLink("动画-滑行-弹跳", destination: AnyView(AnimationContentView())),
        NavigationLink("动画-开门-关门", destination: AnyView(AnimationOpeningDoorView())),
        NavigationLink("动画-打个圆孔", destination: AnyView(AnimationDigCenterHoleView())),
        NavigationLink("动画-随机打孔", destination: AnyView(AnimationDigRandomHolesView())),
        NavigationLink("CoreData", destination: AnyView(CoreDataContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext))),
    ]
    
    init() {
#if swift(>=5.3)
        if #available(iOS 14.0, *) {
            links.append(contentsOf: [
                NavigationLink("数据流-StateObject-ObservedObject-Published 1", destination: AnyView(DataFlow_StateObject_ObservedObject_Published_ParentView())),
                NavigationLink("数据流-StateObject-ObservedObject-Published 2", destination: AnyView(DataFlow_StateObject_ObservedObject_Published_MasterView())),
            ])
        }
#endif
#if swift(>=5.5)
        if #available(iOS 15.0, *) {
            links.append(
                NavigationLink("列表-下拉刷新", destination: AnyView(PullRefreshListView()))
            )
        }
#endif
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<links.count, id: \.self) { i in
                    self.links[i]
                }
            }.navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
