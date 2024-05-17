//
//  CheckoutForm.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 17/05/24.
//

import SwiftUI

struct CheckoutForm: View {
    @State private var items: ProductItem?
    @State private var searchItem: String = ""
    private var itemList:[ProductItem] = [
        ProductItem(id: 1, name: "Surya 12", stocks: 3),
        ProductItem(id: 2, name: "Sampurna Mild", stocks: 6),
        ProductItem(id: 3, name: "Malboro merah", stocks: 6),
        ProductItem(id: 4, name: "Gajah baru", stocks: 6),
        ProductItem(id: 5, name: "Camel Mild", stocks: 6),
        ProductItem(id: 6, name: "Djisamsoe", stocks: 12)
    ]
    @State private var selectedItems: [ProductItem] = []
    @State private var checkinItems: [[ActivityItem]] = []
    
    func setSelectedItem(newItem:ProductItem) -> Void {
        selectedItems.append(newItem)
    }
    
    
    func selectItemOptions(items: [ProductItem]) -> [ProductItem] {
        var result: [ProductItem] = []
        for item in items {
            if !selectedItems.contains(item){
                result.append(item)
            }
        }
        return result
    }
    
    var body: some View {
        VStack(){
            Text("Checkout Items")
                .font(.largeTitle)
                .bold()
            
            Form {
                Section{
                    VDKComboBox(itemProducts: selectItemOptions(items: itemList), text: $searchItem, onSelect: {
                        item in selectedItems.append(item);
                        searchItem = ""
                        }
                    ).frame(width: 320)
                    Button("Confirm checkout", action: {})
                }
                
                
                ScrollView{
                    VStack(alignment:.leading){
                        Section(header: Text("Items")){
                            ForEach(selectedItems){ item in
                                CheckInItemRow(item.name)
                                    .onAppear{}
                            }
                        }
                        .formStyle(.columns)
                    }
                }.padding(.top)
                
            }
        }
        .frame(maxWidth: 400, minHeight: 450,alignment: .topLeading)
        .navigationTitle("Checkout items")
        .padding()
        
        Spacer()
    }
}

#Preview {
    CheckoutForm()
}
