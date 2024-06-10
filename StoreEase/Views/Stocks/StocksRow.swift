//
//  StocksRow.swift
//  StoreEase
//
//  Created by jerry tri tjahyono on 16/05/24.
//

import SwiftUI

struct StocksRow: View {
    var product: Product
    
    var body: some View {
        HStack{
            Text(product.name)
                .font(.headline)
                .fontWeight(.regular)
                .padding(.leading, 10)
            Spacer()
            Text("\(product.stocks)")
                .font(.headline)
                .fontWeight(.regular)
                .padding(.trailing, 10)
        }
        .padding(.vertical, 6)
    }
}
