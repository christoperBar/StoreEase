//
//  StocksList.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 15/05/24.
//

import SwiftUI
import SwiftData

struct StocksList: View {
    @State private var searchItem: String = ""
    @State private var productName: String = ""
    @State private var isShowingSheet = false
    @State private var isShowingUpdateSheet = false
    @State private var selectedSheet: Int = 0
    
    @Environment(\.modelContext) private var context
    @Query(sort:\Product.name) private var products: [Product]
    
    var body: some View {
        List() {
            Section (header: HStack{
                Text("Items")
                    .padding(.leading, 7.0)
                Spacer()
                Text("Stocks")
            }.padding(.horizontal)
            ){
                ForEach(Array(products.enumerated()), id: \.offset) { index,product in
                    if !searchItem.isEmpty{
                        if(product.name.lowercased()).contains(searchItem.lowercased()){
                            StocksRow(product: product)
                                .contextMenu {
                                        Button(action: {
                                            isShowingUpdateSheet.toggle()
                                            selectedSheet = index
                                        }) {
                                            Text("Update")
                                        }
                                    
                                        Button {
                                            context.delete(product)
                                        } label: {
                                            Text("Delete")
                                        }
                                    }
                            
                        }
                    }else{
                        StocksRow(product: product)
                            .contextMenu {
                                    Button(action: {
                                        isShowingUpdateSheet.toggle()
                                        selectedSheet = index
                                    }) {
                                        Text("Update")
                                    }

                                    Button {
                                        context.delete(product)
                                    } label: {
                                        Text("Delete")
                                    }
                                }
                    }
                }
            }
        }.sheet(isPresented: $isShowingUpdateSheet,
                onDismiss: {isShowingUpdateSheet = false}) {
             StockSheet("Update Product",refProduct: $productName, onSubmit: {
                 products[selectedSheet].name = productName
                 isShowingUpdateSheet = false
             }){
                 isShowingUpdateSheet = false
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
                Button(action: {
                    isShowingSheet.toggle()
                }) {
                    Label("", systemImage: "plus")
                }
                .sheet(isPresented: $isShowingSheet,
                       onDismiss: {isShowingSheet = false}) {
                    StockSheet("Add Product",refProduct: $productName, onSubmit: {
                        let newProduct = Product(name: productName)
                        context.insert(newProduct)
                        isShowingSheet = false
                    }){
                        isShowingSheet = false
                    }
                }
                    
            }
        }
        
    }
}

#Preview("Stocks"){
    StocksList()
}
