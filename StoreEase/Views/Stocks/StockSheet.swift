//
//  StockSheet.swift
//  StoreEase
//
//  Created by MacBook Pro on 18/05/24.
//

import SwiftUI

struct StockSheet: View {
    let refProduct : Binding<String>
    let onSubmit: () -> Void
    let title: String
    let onDismiss: () -> Void
    init(_ title: String,refProduct: Binding<String>, onSubmit: @escaping () -> Void, onDismiss: @escaping () -> Void) {
        self.refProduct = refProduct
        self.onSubmit = onSubmit
        self.title = title
        self.onDismiss = onDismiss
    }
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding(10)
            HStack{
                Text("Product Name:")
                    .font(.body)
                TextField("Produt Name", text: refProduct)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        onSubmit()
                    }
            }.padding()
            HStack {
                Button("Cancel", action: {
                    onDismiss()
                }).padding()
                Button(title, action: {
                    onSubmit()
                }).padding()
            }
        }
    }
}
