//
//  MainView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                Group {
                    
                    NavigationLink("列表-静态(当前页面就是)") {
                        StaticListView()
                    }
                    NavigationLink("列表-下拉刷新") {
                        if #available(iOS 15.0, *) {
                            PullRefreshListView()
                        } else {
                            // Fallback on earlier versions
                            Text("iOS 15.0 及更高版本，才支持 refreshable")
                        }
                    }
                    NavigationLink("列表-单项选择") {
                        SingleSelectionListView()
                    }
                    NavigationLink("列表-多项选择") {
                        MultipleSelectionListView()
                    }
                    NavigationLink("列表-自定义选择样式") {
                        CustomSelectionListView()
                    }
                    NavigationLink("列表-CoreData") {
                        CoreDataContentView()
                            .environment(
                                \.managedObjectContext,
                                 PersistenceController.shared.container.viewContext
                            )
                    }
                    NavigationLink {
                        DataFlow_State_Binding_ParentView()
                    } label: {
                        Text("数据流-State-Binding")
                    }
                    NavigationLink {
                        DataFlow_StateObject_ObservedObject_Published_ParentView()
                    } label: {
                        Text("数据流-StateObject-ObservedObject-Published 1")
                    }
                    NavigationLink {
                        DataFlow_StateObject_ObservedObject_Published_MasterView()
                    } label: {
                        Text("数据流-StateObject-ObservedObject-Published 2")
                    }
                    NavigationLink {
                        DataFlow_StateObject_EnvironmentObject_Published_ParentView()
                    } label: {
                        Text("数据流-StateObject-EnvironmentObject-Published")
                    }
                }
                Group {
                    NavigationLink("动画") {
                        AnimationContentView()
                    }
                }
            }
            .listStyle(.plain)
            .dg_navigationTitle("DG Learn SwiftUI")
//            .navigationBarTitleDisplayMode(.inline) // 默认是 large
        }
        .navigationViewStyle(.stack)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
