//
//  CheckoutItemRow.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 20/05/24.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct CheckoutItemRow: View {
    @Environment(ModelData.self) var modelData
    @Binding var item: AddedProduct
    let removeItem: () -> Void
    
    var body: some View {
        HStack{
            TextField( value: $item.qty.onChange({ val in
                if val > item.product.stocks || val < 0 {
                    item.qty = 0
                }
                
            }), format: .number){
                Text("\(item.product.name): \(item.product.stocks)")
                    .frame(width: 150,alignment: .leading)
            }            .frame(width: 280)
            Button(){
                removeItem()
            }label: {
                Image(systemName: "trash")
            }
        }
    }
}
