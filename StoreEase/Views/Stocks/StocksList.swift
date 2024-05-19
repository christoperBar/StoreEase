//
//  StocksList.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 15/05/24.
//

import SwiftUI

struct StocksList: View {
    @Environment(ModelData.self) var modelData
    @State private var searchItem: String = ""
    @State private var productName: String = ""
    @State private var isShowingSheet = false
    @State private var isShowingUpdateSheet = false
//    private var products = modelData.products
    
    var body: some View {
        List() {
            Section (header: HStack{
                Text("Items")
                    .padding(.leading, 7.0)
                Spacer()
                Text("Stocks")
            }.padding(.horizontal)
            ){
                ForEach(modelData.products) { product in
                    if !searchItem.isEmpty{
                        if(product.name.lowercased()).contains(searchItem.lowercased()){
                            StocksRow(product: product)
                                .contextMenu {
                                        Button(action: {
                                            isShowingUpdateSheet.toggle()
                                        }) {
                                            Text("Update")
                                        }
                                    
                                        Button {
                                            
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
                                    }) {
                                        Text("Update")
                                    }

                                    Button {
                                        
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
                 
             }){
                 isShowingUpdateSheet = false
             }
         }
        
        .searchable(text: $searchItem)
        .searchSuggestions{
            ForEach(modelData.products){ item in
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
        .environment(ModelData())
}
