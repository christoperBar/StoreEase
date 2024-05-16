//
//  ActivityItemRow.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ActivityItemRow: View {
    var addedProduct: AddedProduct
    
    var body: some View {
        HStack{
            Text(addedProduct.product.name)
                .font(.body)
            
            Spacer()
            
            Text("\(addedProduct.qty)")
                .font(.body)
                .foregroundStyle(.secondary)
        }.padding(.vertical, 3)
    }

}

//#Preview {
//    return Group{
//        ActivityItemRow(addedProduct: AddedProduct)
//    }
//}
