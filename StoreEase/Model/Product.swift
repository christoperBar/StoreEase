//
//  Product.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation
import SwiftData

@Model
class Product{
    var id: String
    var name: String
    var stocks: Int
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.stocks = 0
    }
    init(name: String, stocks: Int) {
        self.id = UUID().uuidString
        self.name = name
        self.stocks = stocks
    }
}

struct ActivityProduct: Hashable, Identifiable, Codable {
    var id: String
    var name: String
    var stocks: Int
    
    init(id: String, name: String, stocks: Int) {
        self.id = UUID().uuidString
        self.name = name
        self.stocks = 0
    }
    
    init(convert product:Product) {
        self.id = product.id
        self.name = product.name
        self.stocks = product.stocks
    }
}
