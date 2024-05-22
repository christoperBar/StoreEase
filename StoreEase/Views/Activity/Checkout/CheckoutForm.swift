//
//  CheckoutForm.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import SwiftUI
import SwiftData

struct CheckoutForm: View {
    @Environment(ModelData.self) var modelData
    @State private var items: Product?
    @State private var searchItem: String = ""
    @State private var selectedItems: [Product] = []
    @State private var checkinItems: [AddedProduct] = []
    
    @Environment(\.modelContext) private var context
    @Query private var products: [Product]
    @Query private var activities: [Activity]
    
    
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
                    VDKComboBox(itemProducts: selectItemOptions(items: products), text: $searchItem, onSelect: {
                        item in checkinItems.append(AddedProduct(product: ActivityProduct(convert: item), qty: 0) );
                        searchItem = ""
                        }
                    ).frame(width: 320)
                    Button("Confirm checkout", action: checkoutItems)
                }
                
                
                ScrollView{
                    VStack(alignment:.leading){
                        Section(header: Text("Items")){
                            ForEach($checkinItems){$item in
                                CheckoutItemRow(item: $item, removeItem: {
                                    if let checkinItemIndex = checkinItems.firstIndex(where: {$0.id == item.id}){
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
        .navigationTitle("Checkout items")
        .padding()
        
        Spacer()
    }
    private func checkoutItems() -> Void {
        for item in checkinItems {
        
            if item.qty < 1 {
                guard let itemInvalidInputIndex = checkinItems.firstIndex(of: item) else {
                    continue
                }
            
                checkinItems.remove(at: itemInvalidInputIndex)
            }

            guard let index = products.firstIndex(where: { $0.id == item.product.id }) else {
                continue
            }
            
            products[index].stocks -= item.qty
        }
        
        let newActivity = Activity(admin: modelData.currentUser as! Admin, type: .checkOut, listOfAddedProduct: checkinItems)
        context.insert(newActivity)
        
        checkinItems.removeAll()
        selectedItems.removeAll()
        
    }
}

#Preview {
    CheckoutForm()
        .environment(ModelData())
}
