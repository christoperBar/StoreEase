//
//  Activity.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import Foundation

struct Activity: Hashable, Identifiable, Codable {
    var id: Int
    var type: ActivityType
    var listOfAddedProduct: [AddedProduct]
    
    enum ActivityType: String, CaseIterable, Codable, Hashable, Identifiable {
        case checkIn = "Check-in"
        case checkOut = "Check-out"
        
        var id: String { self.rawValue }
    }
}

var activities:[Activity] = [
    Activity(id: 1, type: .checkIn, listOfAddedProduct: [
        AddedProduct(id: 1, product: Product(id:1, name:"Surya 12", stocks: 4), qty: 5),
        AddedProduct(id: 2, product: Product(id:2, name:"Tali Jagat", stocks: 7), qty: 3)
    ]),
    Activity(id: 2, type: .checkOut, listOfAddedProduct: [
        AddedProduct(id: 3, product: Product(id:4, name:"Djisamsoe", stocks: 2), qty: 1),
        AddedProduct(id: 4, product: Product(id:5, name:"Malboro", stocks: 3), qty: 2)
    ])
]
