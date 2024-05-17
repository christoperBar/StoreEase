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
        VStack{
            List(products) { product in
                if !searchItem.isEmpty{
                    if(product.name.lowercased()).contains(searchItem.lowercased()){
                        StocksRow(product: product)
                    }
                }else{
                    StocksRow(product: product)
                }
            }
            .cornerRadius(5)
            .padding(.horizontal)
            
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
        .padding()
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
