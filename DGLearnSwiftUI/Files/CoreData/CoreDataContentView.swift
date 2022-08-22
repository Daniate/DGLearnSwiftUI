//
//  CoreDataContentView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI
import CoreData

extension UserEntity {
    @nonobjc public class func fetchRequestWithSortDescriptors() -> NSFetchRequest<UserEntity> {
        let x = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        x.sortDescriptors = [
            NSSortDescriptor(keyPath: \UserEntity.id, ascending: true)
        ]
        return x
    }
}

struct CoreDataContentView: View {
    // 从视图的环境中获取对应的值
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        fetchRequest: UserEntity.fetchRequestWithSortDescriptors()
    )
    private var items: FetchedResults<UserEntity>
    
    func destinationView(item: UserEntity) -> some View {
        VStack {
            Image(item.avatar ?? "150")
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.pink, lineWidth: 3)
                )
                .shadow(radius: 3)
        }.navigationBarTitle(Text(item.nickname!), displayMode: .inline)
    }
    
    func itemCell(item: UserEntity) -> some View {
        AnyView(
            NavigationLink(
                destination: destinationView(item: item),
                label: {
                    HStack {
                        Image(item.avatar!)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.pink, lineWidth: 3)
                        ).shadow(radius: 3)
                        
                        Text("\(item.id!)")
                    }.padding(8)
            })
        )
    }

    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.self) { item in
                    self.itemCell(item: item)
                }.onDelete(perform: deleteItems)
            }
            
            Text("左滑可删除")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .navigationBarTitle(Text("CoreData"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: addItem) {
            Text("添加")
        })
    }

    private func addItem() {
        withAnimation {
            let newItem = UserEntity(context: viewContext)
            newItem.id  = UUID().uuidString
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
            }.forEach(viewContext.delete)

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

struct CoreDataContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataContentView()
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
