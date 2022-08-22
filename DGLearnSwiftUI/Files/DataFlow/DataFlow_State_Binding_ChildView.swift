//
//  DataFlow_State_Binding_ChildView.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//  Copyright © 2022 daniate. All rights reserved.
//

import SwiftUI

struct DataFlow_State_Binding_ChildView: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.circle" : "circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.accentColor)
            .frame(width: 200, height: 200, alignment: .center)
            .onTapGesture {
                self.isChecked.toggle()
            }
    }
}

struct DataFlow_State_Binding_ChildView_Previews: PreviewProvider {
    static var previews: some View {
        DataFlow_State_Binding_ChildView(isChecked: .constant(false))
    }
}
