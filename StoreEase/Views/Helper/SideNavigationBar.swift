//
//  SideNavigationBar.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 15/05/24.
//

import SwiftUI



struct SideNavigationBar: View {
    @State var currentNavigatedView: ViewList?
    @State var title = "Stocks"
    var setTitle: (String) -> String = { currentView in
        return currentView
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $currentNavigatedView) {
                
                NavigationLink {
                    StocksList()
                } label: {
                    Text("Stocks")
                }
            }
            .animation(.default)
            .navigationTitle(title)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: {}) {
                        Label("Add Item", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
        } detail:{
            Text("Select view page")
        }
    }
}

#Preview {
    SideNavigationBar()
}
