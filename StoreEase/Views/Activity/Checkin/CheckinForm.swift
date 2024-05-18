//
//  CheckinForm.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import SwiftUI
import Foundation
struct ActivityItem {
    var item: Product
    var qty: Int
}

struct CheckinForm: View {
    @State private var items: Product?
    @State private var searchItem: String = ""
    @State private var selectedItems: [Product] = []
    @State private var checkinItems: [[ActivityItem]] = []
    
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
                    VDKComboBox(itemProducts: selectItemOptions(items: products), text: $searchItem, onSelect: {
                        item in selectedItems.append(item);
                        searchItem = ""
                        }
                    ).frame(width: 320)
                    Button("Confirm checkin", action: {})
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
        .navigationTitle("Checkin items")
        .padding()
        
        Spacer()
    }
}

#Preview {
    CheckinForm()
}