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
    @Query private var items: [Item]

    var body: some View {
        if modelData.currentUser is Root {
            AccountList()
        }else if modelData.currentUser is Admin {
            SideNavigationBar()
        }else {
            LoginForm()
        }

    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
    ContentView()
        .environment(ModelData())
}
