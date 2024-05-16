//
//  Product.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation

struct Product: Hashable, Identifiable, Codable {
    var id: Int
    var name: String
    var stocks: Int
}

struct AddedProduct: Hashable, Identifiable, Codable {
    var id: Int
    var product: Product
    var qty: Int
    
    init(id: Int, product: Product, qty: Int) {
        self.id = id
        self.product = product
        self.qty = qty
    }
}

var products:[Product] = [
    Product(id:1, name:"Surya 12", stocks: 4),
    Product(id:2, name:"Tali Jagat", stocks: 7),
    Product(id:3, name:"Sampoerna", stocks: 9),
    Product(id:4, name:"Djisamsoe", stocks: 2),
    Product(id:5, name:"Malboro", stocks: 3),
    Product(id:6, name:"International", stocks: 8),
    Product(id:7, name:"76 Kretek", stocks: 1),
    Product(id:8, name:"Mangga 76", stocks: 15),
    Product(id:9, name:"Dunhill", stocks: 12),
    Product(id:10, name:"Gudang Garam Merah", stocks: 18),
    Product(id:11, name:"92 Kretek", stocks: 16),
    Product(id:12, name:"Gajah Baru", stocks: 5),
    Product(id:13, name:"Lucky Strike", stocks: 19)
]
