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
    
    func selectItemOptions(items: [Product]) -> [Product] {
        var result: [Product] = []
        for item in items {
            
            if let index = checkinItems.firstIndex(where: { $0.product.name == item.name }){
                continue
            }else{
                result.append(item)
            }
        }
        return result
    }
    
    var body: some View {
        VStack(){

            Form {
                Section{
                    Text("Choose product")
                        .font(.callout)
                    VDKComboBox(itemProducts: selectItemOptions(items: modelData.products), text: $searchItem, onSelect: {
                        item in checkinItems.append(AddedProduct(product: item, qty: 0) );
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
                        
                        let newActivity = Activity(admin: Admin(username: "Azewt", password: "azezet"),type: .checkIn, listOfAddedProduct: checkinItems)
                        modelData.activities.append(newActivity)
                        
                        checkinItems.removeAll()
                        selectedItems.removeAll()
                        
                    })
                }
                
                ScrollView{
                    VStack(alignment:.leading){
                        Section(header: Text("Items")){
                            ForEach($checkinItems){$item in
                                CheckInItemRow(item: $item, removeItem: {
                                    if let checkinItemIndex = checkinItems.firstIndex(where: {$0.id == item.id}){
                                        print("OnDelete🦠 checkinItems[indexCheckin].qty")
                                        print(checkinItems[checkinItemIndex].product.name)
                                        print(checkinItems[checkinItemIndex].qty)
                                        checkinItems.remove(at: checkinItemIndex)
                                    }
                                })
                                    
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
