//
//  PullRefreshListView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

@available(iOS 15.0, *)
struct PullRefreshListView: View {
    private let NUM_PER_PAGE = 20
    private let USECONDS_SLEEP: useconds_t = 1500000
    
    // 使用 @State 对属性进行包装，当属性发生变化时，界面会随之发生变化
    @State private var entities: [DGItemEntity]
    @State private var refreshCounter: Int = 0
    
    init() {
        var x: [DGItemEntity] = []
        for i in 0..<NUM_PER_PAGE {
            x.append(DGItemEntity(content: "Item \(i)"))
        }
        // 在初始化时，不要直接使用 entities.append(xxx)
        _entities = State(initialValue: x)
        
        /// 这种写法是错误的
        /**
        entities = []
        for i in 0..<10 {
            entities.append(DGItemEntity(content: "Item \(i)"))
        }
        */
    }
    
    var body: some View {
        List {
            ForEach(entities, content: { entity in
                Text(entity.content)
                    .foregroundColor(refreshCounter % 2 == 1 ? .red : .accentColor)
            })
        }
        .navigationTitle("下拉刷新")
        .refreshable {
            await handlePullRefreshRandom()
        }
    }
    
    func handlePullRefreshRandom() async {
        if arc4random_uniform(2) == 0 {
            entities = await handlePullRefresh0()
        } else {
            await handlePullRefresh1()
        }
        refreshCounter += 1
    }
    
    func handlePullRefresh0() async -> [DGItemEntity] {
        // 休眠一下（模拟网络请求）
        usleep(USECONDS_SLEEP)
        
        var x: [DGItemEntity] = []
        for i in 0..<NUM_PER_PAGE {
            x.append(DGItemEntity(content: "Item \(i + (refreshCounter + 1) * NUM_PER_PAGE)"))
        }
        return x
    }
    
    func handlePullRefresh1() async {
        // 休眠一下（模拟网络请求）
        usleep(USECONDS_SLEEP)
        
        entities.removeAll()
        for i in 0..<NUM_PER_PAGE {
            entities.append(DGItemEntity(content: "Item \(i + (refreshCounter + 1) * NUM_PER_PAGE)"))
        }
    }
}

struct DynamicPullRefreshListView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            PullRefreshListView()
        } else {
            // Fallback on earlier versions
            Text("iOS 15.0 及更高版本，才支持 refreshable")
        }
    }
}
