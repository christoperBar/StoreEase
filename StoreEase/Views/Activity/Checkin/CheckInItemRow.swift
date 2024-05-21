//
//  CheckInItemRow.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import SwiftUI

struct CheckInItemRow: View {
    @Binding var item: AddedProduct
    let removeItem: () -> Void
    
    
    var body: some View {
        HStack{
            TextField( value: $item.qty, format: .number  ){
                Text(item.product.name)
                    .frame(width: 150,alignment: .leading)
            }
            .frame(width: 280)
            Button(){
                removeItem()
            }label: {
                Image(systemName: "trash")
            }
        }
    }
}
