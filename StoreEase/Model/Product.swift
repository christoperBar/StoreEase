//
//  Product.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation

struct Product: Hashable, Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var stocks: Int = 0
    
}

var products:[Product] = [
    Product(name:"Surya 12", stocks: 4),
    Product(name:"Tali Jagat", stocks: 7),
    Product(name:"Sampoerna", stocks: 9),
    Product(name:"Djisamsoe", stocks: 2),
    Product(name:"Malboro", stocks: 3),
    Product(name:"International", stocks: 8),
    Product(name:"76 Kretek", stocks: 1),
    Product(name:"Mangga 76", stocks: 15),
    Product(name:"Dunhill", stocks: 12),
    Product(name:"Gudang Garam Merah", stocks: 18),
    Product(name:"92 Kretek", stocks: 16),
    Product(name:"Gajah Baru", stocks: 5),
    Product(name:"Lucky Strike", stocks: 19)
]
