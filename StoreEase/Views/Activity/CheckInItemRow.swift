//
//  CheckInItemRow.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import SwiftUI

struct CheckInItemRow: View {
    let itemName: String
    let initQty: (Int) -> Void
    let removeItem: () -> Void
    
    init(_ itemName: String, removeItem: @escaping () -> Void, initQty: @escaping (Int) -> Void) {
        self.itemName = itemName
        self.removeItem = removeItem
        self.initQty = initQty
    }
    
    @State var qty: Int = 0
    var body: some View {
        HStack{
            TextField( value: $qty, format: .number  ){
                Text(itemName)
                    .frame(width: 150,alignment: .leading)
            }
            .frame(width: 280)
            .onChange(of: qty){
                initQty(qty)
            }
            Button(){
                removeItem()
            }label: {
                Image(systemName: "trash")
            }
        }
    }
}

#Preview {
    CheckInItemRow("item name", removeItem: {}){
        qty in
    }
}
