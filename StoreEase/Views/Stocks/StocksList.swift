//
//  StocksList.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 15/05/24.
//

import SwiftUI

struct StocksList: View {
    @State private var searchItem: String = ""
    
    
    var body: some View {
        List() {
            Section (header: HStack{
                Text("Items")
                    .padding(.leading, 7.0)
                Spacer()
                Text("Stocks")
            }.padding(.horizontal)
            ){
                ForEach(products) { product in
                    if !searchItem.isEmpty{
                        if(product.name.lowercased()).contains(searchItem.lowercased()){
                            StocksRow(product: product)
                        }
                    }else{
                        StocksRow(product: product)
                    }
                }
            }
        }
        
        .searchable(text: $searchItem)
        .searchSuggestions{
            ForEach(products){ item in
                if(item.name.lowercased()).contains(searchItem.lowercased()){
                    Button(action: {searchItem = item.name}) {
                        Label(item.name, systemImage: "")
                    }
                }
            }
        }
        
        .navigationTitle("Stocks")
        .toolbar {
            ToolbarItem {
                Button(action: {}) {
                    Label("", systemImage: "plus")
                        .foregroundColor(Color.gray)
                }
            }
        }
        
    }
}

#Preview("Stocks"){
    StocksList()
}
