//
//  CoreDataContentView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI
import CoreData

struct CoreDataContentView: View {
    // 从视图的环境中获取对应的值
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<UserEntity>

    var body: some View {
        VStack {
            Text("左滑可删除")
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack {
                            Image(item.avatar ?? "150")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(
                                        cornerRadius: 20
                                    )
                                    .stroke(
                                        Color.pink,
                                        lineWidth: 3
                                    )
                                )
                                .shadow(radius: 3)
                            Text(item.nickname ?? "nickname is empty")
                                .font(.system(size: 24))
                                .bold()
                        }
                        .navigationBarTitle(item.nickname ?? "nickname is empty")
                    } label: {
                        HStack {
                            Image(item.avatar ?? "150")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(
                                    RoundedRectangle(
                                        cornerRadius: 20
                                    )
                                    .stroke(
                                        Color.green,
                                        lineWidth: 3
                                    )
                                )
                                .shadow(radius: 3)
                            Text(item.id?.uuidString ?? "UUID is Empty")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
        .navigationTitle("CoreData")
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Text("添加")
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = UserEntity(context: viewContext)
            newItem.id = UUID()
            newItem.avatar = "15\(arc4random_uniform(5))"
            newItem.nickname = "yool{\(arc4random_uniform(50))}"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                items[$0]
            }
            .forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataContentView()
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
