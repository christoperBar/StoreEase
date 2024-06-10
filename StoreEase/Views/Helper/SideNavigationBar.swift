//
//  SideNavigationBar.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 15/05/24.
//

import SwiftUI



struct SideNavigationBar: View {
    @Environment(ModelData.self) var modelData
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
                
                NavigationLink {
                    CheckinForm()
                } label: {
                    Text("Checkin")
                }
                
                NavigationLink {
                    CheckoutForm()
                } label: {
                    Text("Checkout")
                }
                
                NavigationLink {
                    HistoryList()
                } label: {
                    Text("History")
                }
                
            }
            .animation(.default)
            .navigationTitle(title)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        modelData.currentUser = nil
                    }) {
                        Label("", systemImage: "rectangle.portrait.and.arrow.right")
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
        .environment(ModelData())
}
