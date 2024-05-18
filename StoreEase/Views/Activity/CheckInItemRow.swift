//
//  CheckInItemRow.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import SwiftUI

struct CheckInItemRow: View {
    let itemName: String
    init(_ itemName: String) {
        self.itemName = itemName
        self.qty = qty
    }
    
    @State var qty: Int = 0
    var body: some View {
        HStack{
            
            TextField( value: $qty, format: .number  ){
                Text(itemName)
                    .frame(width: 150,alignment: .leading)
            }.frame(width: 280)
            
            Button(){
        
            }label: {
                Image(systemName: "trash")
            }
        }
    }
}

#Preview {
    CheckInItemRow("item name")
}
