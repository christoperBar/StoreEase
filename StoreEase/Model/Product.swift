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
    
    init(name: String, context: ModelContext) {
        self.id = UUID().uuidString
        self.name = name
        self.stocks = 0
        
        context.insert(self)
    }
    init(name: String, stocks: Int) {
        self.id = UUID().uuidString
        self.name = name
        self.stocks = stocks
    }
    
    func updateProduct(_ name:String) -> Void {
        self.name = name
    }
    
    func deleteProduct(context: ModelContext) -> Void {
        context.delete(self)
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
