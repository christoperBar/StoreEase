//
//  CheckinForm.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import SwiftUI
import Foundation

struct CheckinForm: View {
    @Environment(ModelData.self) var modelData
    @State private var items: Product?
    @State private var searchItem: String = ""
    @State private var selectedItems: [Product] = []
    @State private var checkinItems: [AddedProduct] = []
    
    func setSelectedItem(newItem:Product) -> Void {
        selectedItems.append(newItem)
    }
    
    func selectItemOptions(items: [Product]) -> [Product] {
        var result: [Product] = []
        for item in items {
            if !selectedItems.contains(item){
                result.append(item)
            }
        }
        return result
    }
    
    var body: some View {
        VStack(){
            Text("Checkin Items")
                .font(.largeTitle)
                .bold()
            
            Form {
                Section{
                    VDKComboBox(itemProducts: selectItemOptions(items: modelData.products), text: $searchItem, onSelect: {
                        item in selectedItems.append(item);
                        searchItem = ""
                        }
                    ).frame(width: 320)
                    Button("Confirm checkin", action: {
                        for item in checkinItems {
                            guard let index = modelData.products.firstIndex(where: { $0.id == item.product.id }) else {
                                continue
                            }
                            modelData.products[index].stocks += item.qty
                        }
                        
                        let newActivity = Activity(type: .checkIn, listOfAddedProduct: checkinItems)
                        modelData.activities.append(newActivity)
                        
                        checkinItems.removeAll()
                        selectedItems.removeAll()
                        
                    })
                }
                
                ScrollView{
                    VStack(alignment:.leading){
                        Section(header: Text("Items")){
                            ForEach(Array(selectedItems.enumerated()), id: \.offset){index, item in
                                CheckInItemRow(item.name, removeItem: {
                                    selectedItems.remove(at: index)
                                    checkinItems.remove(at: index)
                                }){
                                    qty in
                                    checkinItems[index].qty = qty
                                }
                                    .onAppear{
                                        checkinItems.append(AddedProduct(product: item, qty: 0) )
                                    }
                            }
                        }
                        .formStyle(.columns)
                    }
                }.padding(.top)
            }
        }
        .frame(maxWidth: 400, minHeight: 450,alignment: .topLeading)
        .navigationTitle("Checkin items")
        .padding()
        
        Spacer()
    }
}

#Preview {
    CheckinForm()
        .environment(ModelData())
}
