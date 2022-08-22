//
//  View+DG.swift
//  DGLearnSwiftUI
//
//  Created by daniate on 2022/8/20.
//

import SwiftUI

extension View {
    func dg_overlay<V>(alignment: Alignment = .center, content: V) -> some View where V : View {
        #if swift(>=5.5)
        if #available(iOS 15.0, *) {
            return AnyView(overlay(alignment: alignment) {
                content
            })
        }
        #endif
        // Fallback on earlier versions
        return AnyView(overlay(content, alignment: alignment))
    }
    
    func dg_navigationTitle(_ title: Text, displayMode: NavigationBarItem.TitleDisplayMode = .inline) -> some View {
        #if swift(>=5.3)
        if #available(iOS 14.0, *) {
            return AnyView(navigationTitle(title).navigationBarTitleDisplayMode(displayMode))
        }
        #endif
        // Fallback on earlier versions
        return AnyView(navigationBarTitle(title, displayMode: displayMode))
    }
    
    func dg_navigationTitle(_ title: String, displayMode: NavigationBarItem.TitleDisplayMode = .inline) -> some View {
        return AnyView(dg_navigationTitle(Text(title), displayMode: displayMode))
    }
    
    func dg_navigationBarItems<L, T>(leading: L, trailing: T) -> some View where L : View, T : View {
        #if swift(>=5.3)
        if #available(iOS 14.0, *) {
            return AnyView(toolbar(content: {
                Group {
                    ToolbarItem {
                        leading
                    }
                    ToolbarItem {
                        trailing
                    }
                }
            }))
        }
        #endif
        // Fallback on earlier versions
        return AnyView(navigationBarItems(leading: leading, trailing: trailing))
    }
}
