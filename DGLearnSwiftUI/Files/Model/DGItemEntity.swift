//
//  DGItemEntity.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import Foundation

class DGItemEntity: Identifiable, Hashable, ObservableObject {
    static func == (lhs: DGItemEntity, rhs: DGItemEntity) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: UUID = UUID()
    var content: String
    @Published var isLiked: Bool
    
    init(content: String = "", isLiked: Bool = false) {
        self.content = content
        self.isLiked = isLiked
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
