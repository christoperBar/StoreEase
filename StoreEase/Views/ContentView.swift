//
//  ContentView.swift
//  StoreEase
//
//  Created by MacBook Pro on 15/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.modelContext) private var modelContext
    @Query private var roots: [Root]
    
    var body: some View {
        if roots.isEmpty {
            RegisterRootForm()
        }
        else{
            if modelData.currentUser is Root {
                AccountList()
            }else if modelData.currentUser is Admin {
                SideNavigationBar()
            }else {
                LoginForm()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
